/* Compile with -O2 and -funroll-loops */

#include <stdio.h>
#include <stdint.h>

#define ARRAY_SIZE			200
#define MEASUREMENT_COUNT	ARRAY_SIZE - 1

typedef uint64_t ticks_t[ARRAY_SIZE];

__always_inline uint64_t rdtsc()
{
	uint32_t lo, hi;
	asm volatile("rdtsc" : "=a" (lo), "=d" (hi));
	return (uint64_t)hi << 32 | lo;
}

__always_inline void trap()
{
	asm volatile("movl $0, %%eax; cpuid" ::: "%eax", "%ebx", "%ecx", "%edx");
}

uint64_t calc_avg(ticks_t array)
{
	uint64_t avg = 0;
	int i;
	for (i = 1; i < ARRAY_SIZE; i++) {
		avg += (array[i] - array[i - 1]);
	}
	return avg / MEASUREMENT_COUNT;
}

uint64_t tsc_native()
{
	int i;
	ticks_t val;

	for (i = 0; i < ARRAY_SIZE; i++)
	{
		val[i] = rdtsc();
	}
	return calc_avg(val);
}

uint64_t tsc_trapped()
{
	int i;
	ticks_t val;

	for (i = 0; i < ARRAY_SIZE; i++)
	{
		val[i] = rdtsc();
		trap();
	}
	return calc_avg(val);
}

int main()
{
	uint64_t native, trapped;

	native  = tsc_native();
	trapped = tsc_trapped();
	printf("PP|TSC-native:%llu\n", native);
	printf("PP|roundtrip-cycles:%llu\n", trapped - native);
	return 0;
}

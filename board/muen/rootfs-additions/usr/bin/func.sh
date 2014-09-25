print()
{
	echo "$1" >> $OUTPUT
}

date_print()
{
	print ""
	print "$1"
	print "`date`"
	print ""
}

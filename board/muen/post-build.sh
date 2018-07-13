#!/bin/sh

rm -f ${TARGET_DIR}/etc/init.d/S40xorg

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/bin/cttyhack /bin/sh' ${TARGET_DIR}/etc/inittab
fi

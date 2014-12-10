################################################################################
#
# sysbench
#
################################################################################

SYSBENCH_VERSION = 0.4.12.orig
SYSBENCH_SOURCE = sysbench_$(SYSBENCH_VERSION).tar.gz
SYSBENCH_SITE = http://ftp.de.debian.org/debian/pool/main/s/sysbench
SYSBENCH_CONF_OPTS = --without-mysql --disable-aio
SYSBENCH_AUTORECONF = YES

define SYSBENCH_PRE_CONFIGURE_FIXUP
	touch $(@D)/AUTHORS
	touch $(@D)/NEWS
endef
SYSBENCH_PRE_CONFIGURE_HOOKS += SYSBENCH_PRE_CONFIGURE_FIXUP

$(eval $(autotools-package))

################################################################################
#
# ttyrun
#
################################################################################

TTYRUN_VERSION       = 2.30.0
TTYRUN_SITE          = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
TTYRUN_LICENSE       = MIT
TTYRUN_LICENSE_FILES = LICENSE

TTYRUN_MAKE_OPTS = \
	ARCH=$(BR2_ARCH) \
	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
	HAVE_CARGO=0

define TTYRUN_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		-C $(@D)/iucvterm/src $(TTYRUN_TOOLS_MAKE_OPTS) ttyrun
endef

define TTYRUN_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/iucvterm/src/ttyrun $(TARGET_DIR)/sbin/ttyrun
endef

define TTYRUN_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/sbin/ttyrun
endef

$(eval $(generic-package))

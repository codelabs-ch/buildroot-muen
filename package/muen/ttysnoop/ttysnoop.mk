################################################################################
#
# ttysnoop
#
################################################################################

TTYSNOOP_VERSION = 0.12d.k26
TTYSNOOP_SOURCE = ttysnoop-$(TTYSNOOP_VERSION).tar.gz
TTYSNOOP_SITE = http://sysd.org/stas/files/active/0

define TTYSNOOP_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
endef

define TTYSNOOP_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/ttysnoop $(TARGET_DIR)/usr/bin/ttysnoop
	$(INSTALL) -m 0755 -D $(@D)/ttysnoops $(TARGET_DIR)/usr/bin/ttysnoops
	$(INSTALL) -m 0644 -D package/muen/ttysnoop/snooptab $(TARGET_DIR)/etc/snooptab
endef

define TTYSNOOP_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/ttysnoop $(TARGET_DIR)/usr/bin/ttysnoops
	rm -f $(TARGET_DIR)/etc/snooptab
endef

$(eval $(generic-package))

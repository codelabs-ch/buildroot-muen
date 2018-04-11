################################################################################
#
# CJAG
#
################################################################################

CJAG_VERSION      = master
CJAG_SITE         = https://github.com/IAIK/CJAG.git
CJAG_SITE_METHOD  = git

define CJAG_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
endef

define CJAG_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/cjag $(TARGET_DIR)/usr/bin/cjag
endef

define CJAG_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/cjag
endef

$(eval $(generic-package))

################################################################################
#
# pingpong
#
################################################################################

# source included in buildroot
PINGPONG_SOURCE  =
PINGPONG_VERSION = 0.1

PP_BIN = pingpong
PP_SRC = package/muen/pingpong/$(PP_BIN).c

TARGET_CFLAGS := -O2 -funroll-loops

define PINGPONG_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
		$(PP_SRC) -o $(@D)/$(PP_BIN)
endef

define PINGPONG_INSTALL_TARGET_CMDS
	install -D -m 755 $(@D)/$(PP_BIN) $(TARGET_DIR)/usr/bin/$(PP_BIN)
endef

define PINGPONG_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/$(PP_BIN)
endef

$(eval $(generic-package))

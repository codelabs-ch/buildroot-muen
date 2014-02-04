################################################################################
#
# mingetty
#
################################################################################

MINGETTY_VERSION = 1.08
MINGETTY_SOURCE = mingetty-$(MINGETTY_VERSION).tar.gz
MINGETTY_SITE = http://downloads.sourceforge.net/project/mingetty/mingetty/$(MINGETTY_VERSION)

define MINGETTY_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
endef

define MINGETTY_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/mingetty $(TARGET_DIR)/sbin/mingetty
endef

define MINGETTY_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/sbin/mingetty
endef

$(eval $(generic-package))

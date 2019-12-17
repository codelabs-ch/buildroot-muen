################################################################################
#
# muenfs
#
################################################################################

MUENFS_VERSION     = d5a5889e3a98a3a3752c72883aa89ee70353225c
MUENFS_SITE        = https://git.codelabs.ch/git/muen/linux/muenfs.git
MUENFS_SITE_METHOD = git

MUENFS_MAKE_OPTS = DESTDIR=$(TARGET_DIR)

define MUENFS_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENFS_MAKE_OPTS) -C $(@D) compile-test
endef

define MUENFS_INSTALL_TARGET_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENFS_MAKE_OPTS) -C $(@D) install-test
endef

define MUENFS_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/sbin/muenfs-test
	rm -f $(TARGET_DIR)/usr/sbin/muenfs-marker
endef

$(eval $(generic-package))

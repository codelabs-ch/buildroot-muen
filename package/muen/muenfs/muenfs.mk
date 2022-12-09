################################################################################
#
# muenfs
#
################################################################################

MUENFS_VERSION     = a554aa0109d8c372e67f4b4d0a38fdcc5610743d
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
	rm -f $(TARGET_DIR)/usr/sbin/muenfs-example
endef

$(eval $(generic-package))

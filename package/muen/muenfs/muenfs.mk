################################################################################
#
# muenfs
#
################################################################################

MUENFS_VERSION     = f24a9deba6a76ab343f1bc3d88cb7ae272864a95
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

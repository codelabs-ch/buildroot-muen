################################################################################
#
# muenfs
#
################################################################################

MUENFS_VERSION     = 12f31e82a08f105163ef4e2ada286e8466aab344
MUENFS_SITE        = https://git.codelabs.ch/git/muen/linux/muenfs.git
MUENFS_SITE_METHOD = git

MUENFS_DEPENDENCIES = lmods

MUENFS_KNL_VER = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
MUENFS_KNL_SRC = $(TOPDIR)/output/build/linux-headers-$(MUENFS_KNL_VER)

MUENFS_MAKE_OPTS  = DESTDIR=$(TARGET_DIR)
MUENFS_MAKE_OPTS += KERNEL_SOURCE=$(MUENFS_KNL_SRC)

define MUENFS_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENFS_MAKE_OPTS) -C $(@D)
endef

define MUENFS_INSTALL_TARGET_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENFS_MAKE_OPTS) -C $(@D) install
endef

define MUENFS_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/lib/modules/extra/muenfs.ko
	rm -f $(TARGET_DIR)/usr/sbin/muenfs-test
	rm -f $(TARGET_DIR)/usr/sbin/muenfs-marker
endef

$(eval $(generic-package))

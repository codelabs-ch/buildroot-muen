################################################################################
#
# muenblock
#
################################################################################

MUENBLOCK_VERSION     = ca65203cb27bfe0de75b27fb660d816b6dc7e2c3
MUENBLOCK_SITE        = https://git.codelabs.ch/git/muen/linux/muenblock
MUENBLOCK_SITE_METHOD = git

MUENBLOCK_DEPENDENCIES = lmods

MUENBLOCK_KNL_VER = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
MUENBLOCK_KNL_SRC = $(TOPDIR)/output/build/linux-headers-$(MUENBLOCK_KNL_VER)

MUENBLOCK_MAKE_OPTS  = DESTDIR=$(TARGET_DIR)
MUENBLOCK_MAKE_OPTS += KERNEL_SOURCE=$(MUENBLOCK_KNL_SRC)

define MUENBLOCK_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENBLOCK_MAKE_OPTS) -C $(@D)
endef

define MUENBLOCK_INSTALL_TARGET_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENBLOCK_MAKE_OPTS) -C $(@D) install
endef

define MUENBLOCK_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/lib/modules/extra/muenblock-client.ko
	rm -f $(TARGET_DIR)/lib/modules/extra/muenblock-server.ko
endef

$(eval $(generic-package))

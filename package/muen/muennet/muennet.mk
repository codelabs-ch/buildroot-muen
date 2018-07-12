################################################################################
#
# muennet
#
################################################################################

MUENNET_VERSION     = fde7866fe7b0ae75b21ee13cc054988e522157cf
MUENNET_SITE        = https://git.codelabs.ch/git/muen/linux/muennet.git
MUENNET_SITE_METHOD = git

MUENNET_DEPENDENCIES = lmods

MUENNET_KNL_VER = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
MUENNET_KNL_SRC = $(TOPDIR)/output/build/linux-headers-$(MUENNET_KNL_VER)

MUENNET_MAKE_OPTS  = DESTDIR=$(TARGET_DIR)
MUENNET_MAKE_OPTS += KERNEL_SOURCE=$(MUENNET_KNL_SRC)

define MUENNET_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENNET_MAKE_OPTS) -C $(@D)
endef

define MUENNET_INSTALL_TARGET_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENNET_MAKE_OPTS) -C $(@D) install
endef

define MUENNET_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/lib/modules/extra/muennet.ko
endef

$(eval $(generic-package))

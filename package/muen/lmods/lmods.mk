################################################################################
#
# lmods
#
################################################################################

LMODS_SOURCE  =
LMODS_VERSION = 0.1

LMODS_DEPENDENCIES = linux-headers

LMODS_KNL_VER = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
LMODS_KNL_SRC = $(TOPDIR)/output/build/linux-headers-$(LMODS_KNL_VER)

LMODS_KNL_CNF_REF   = refs/heads/devel
LMODS_KNL_CNF_PRJ   = https://git.codelabs.ch/?p=muen.git
LMODS_KNL_CNF_OPTS  = hb=$(LMODS_KNL_CNF_REF);a=blob_plain
LMODS_KNL_CNF_FILE  = f=components/linux/config/linux64-4.14
LMODS_KERNEL_CONFIG = \
	$(LMODS_KNL_CNF_PRJ);$(LMODS_KNL_CNF_OPTS);$(LMODS_KNL_CNF_FILE)

LMODS_MAKE_OPTS  = DESTDIR=$(TARGET_DIR)
LMODS_MAKE_OPTS += KERNEL_SOURCE=$(LMODS_KNL_SRC)

define LMODS_BUILD_CMDS
	wget -c "$(LMODS_KERNEL_CONFIG)" -O "$(LMODS_KNL_SRC)/.config"
	$(MAKE) CC="$(TARGET_CC)" -C $(LMODS_KNL_SRC) modules_prepare
endef

define LMODS_CLEAN_CMDS
	$(MAKE) linux-headers-dirclean
	$(MAKE) linux-headers-install-staging
endef

$(eval $(generic-package))

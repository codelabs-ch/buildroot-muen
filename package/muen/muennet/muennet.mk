################################################################################
#
# muennet
#
################################################################################

MUENNET_VERSION     = a0c58b66a8b6e6ed489ced579d46ff6527663e05
MUENNET_SITE        = https://git.codelabs.ch/git/muen/linux/muennet.git
MUENNET_SITE_METHOD = git
MUENNET_CFLAGS      = `$(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0`
MUENNET_LDFLAGS     = `$(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0`

MUENNET_DEPENDENCIES = host-pkgconf libnl

MUENNET_MAKE_OPTS = DESTDIR=$(TARGET_DIR)

define MUENNET_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(MUENNET_CFLAGS)" \
				LDFLAGS="$(TARGET_LDFLAGS) $(MUENNET_LDFLAGS)" \
				$(MUENNET_MAKE_OPTS) -C $(@D) compile-tool
endef

define MUENNET_INSTALL_TARGET_CMDS
	$(MAKE) CC="$(TARGET_CC)" $(MUENNET_MAKE_OPTS) -C $(@D) install-tool
endef

define MUENNET_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/muennet_cfg
endef

$(eval $(generic-package))

################################################################################
#
# ioquake3
#
################################################################################

IOQUAKE3_VERSION       = 809a7765b25a6030dbf42ce7a728c28bfed2e991
IOQUAKE3_SITE          = https://github.com/ioquake/ioq3.git
IOQUAKE3_SITE_METHOD   = git
IOQUAKE3_LICENSE       = GPL-2.0
IOQUAKE3_LICENSE_FILES = COPYING
IOQUAKE3_DEPENDENCIES  = host-pkgconf jpeg libgl libglu libpng openal sdl2 zlib

IOQUAKE3_MAKE_OPTS = USE_INTERNAL_LIBS=0 \
					 COPYDIR=$(TARGET_DIR)/usr/games/quake3 \
					 PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig

ifeq ($(BR2_PACKAGE_LIBCURL),y)
IOQUAKE3_DEPENDENCIES += libcurl
IOQUAKE3_MAKE_OPTS += USE_CURL=1
else
IOQUAKE3_MAKE_OPTS += USE_CURL=0
endif

ifeq ($(BR2_PACKAGE_FREETYPE),y)
IOQUAKE3_DEPENDENCIES += freetype
IOQUAKE3_MAKE_OPTS += USE_FREETYPE=1
else
IOQUAKE3_MAKE_OPTS += USE_FREETYPE=0
endif

ifeq ($(BR2_PACKAGE_OPUSFILE),y)
IOQUAKE3_DEPENDENCIES += opusfile
IOQUAKE3_MAKE_OPTS += USE_CODEC_OPUS=1
else
IOQUAKE3_MAKE_OPTS += USE_CODEC_OPUS=0
endif

ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
IOQUAKE3_DEPENDENCIES += libvorbis
IOQUAKE3_MAKE_OPTS += USE_CODEC_VORBIS=1
else
IOQUAKE3_MAKE_OPTS += USE_CODEC_VORBIS=0
endif

define IOQUAKE3_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" $(IOQUAKE3_MAKE_OPTS) -C $(@D)
endef

define IOQUAKE3_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" $(IOQUAKE3_MAKE_OPTS) -C $(@D) copyfiles
endef

$(eval $(generic-package))

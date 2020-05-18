# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := zplugins
$(PKG)_WEBSITE  := https://github.com/zrythm/ZPlugins
$(PKG)_DESCR    := zrythm plugins
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1e44506
$(PKG)_CHECKSUM := acca98b2b5717935a9ab0a3ea605f56ee79159a504a34d782fde2ee820b0678f
$(PKG)_GH_CONF  := zrythm/ZPlugins/branches/master
$(PKG)_DEPS     := cc cairo librsvg

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && \
		cp -R /home/ansible/Documents/git/ZPlugins/subprojects/* ./subprojects/
	cd $(SOURCE_DIR)/ext/Soundpipe && \
		$(MAKE) CC=$(TARGET)-gcc
	cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' --wrap-mode=nodownload \
		--buildtype=debug
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

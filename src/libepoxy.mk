# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libepoxy
$(PKG)_WEBSITE  := https://github.com/anholt/libepoxy
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.5.4
$(PKG)_CHECKSUM := 0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2
$(PKG)_SUBDIR   := libepoxy-$($(PKG)_VERSION)
$(PKG)_FILE     := libepoxy-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://github.com/anholt/libepoxy/releases/download/$($(PKG)_VERSION)/libepoxy-$($(PKG)_VERSION).tar.xz
$(PKG)_DEPS     := cc xorg-macros meson-wrapper

define $(PKG)_BUILD
	cd $(SOURCE_DIR) && \
		$(SED) -i -e \
		"s/DllMain/$(if $(BUILD_STATIC),epoxy_DllMain,DllMain)/g" \
		src/dispatch_wgl.c
	cd '$(SOURCE_DIR)' && $(TARGET)-meson $(BUILD_DIR)
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

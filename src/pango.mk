# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := pango
$(PKG)_WEBSITE  := https://www.pango.org/
$(PKG)_DESCR    := Pango
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.43.0
$(PKG)_CHECKSUM := d2c0c253a5328a0eccb00cdd66ce2c8713fabd2c9836000b6e22a8b06ba3ddd2
$(PKG)_SUBDIR   := pango-$($(PKG)_VERSION)
$(PKG)_FILE     := pango-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/pango/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc cairo fontconfig freetype glib harfbuzz fribidi

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/pango/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    head -1
endef

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' \
		--default-library $(if $(BUILD_STATIC),static,shared) \
		-Denable_docs=false \
		-Dgir=false
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

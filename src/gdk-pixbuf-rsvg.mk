# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gdk-pixbuf-rsvg
$(PKG)_WEBSITE  := https://gtk.org/
$(PKG)_DESCR    := GDK-pixbuf with rsvg
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.40.0
$(PKG)_CHECKSUM := 1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6
$(PKG)_SUBDIR   := gdk-pixbuf-$($(PKG)_VERSION)
$(PKG)_FILE     := gdk-pixbuf-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/gdk-pixbuf/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc glib2 jasper jpeg libiconv libpng tiff librsvg

define $(PKG)_BUILD
	cd $(SOURCE_DIR) && \
		$(TARGET)-meson $(BUILD_DIR) \
		-Dx11=false \
		-Dinstalled_tests=false \
		-Drelocatable=true \
		-Djasper=true \
		-Ddocs=false \
		-Dman=false \
		-Dgir=false \
		-Dnative_windows_loaders=true \
		-Dbuiltin_loaders=windows
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

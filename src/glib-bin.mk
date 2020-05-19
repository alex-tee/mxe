# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := glib-bin
$(PKG)_WEBSITE  := https://gtk.org/
$(PKG)_DESCR    := GLib bin
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.64.2
$(PKG)_CHECKSUM := 2e0c7986fd20b1eb5cac9c11e1e357c3b9b961e857f192a7a1fb4ce9b966bb3b
$(PKG)_SUBDIR   := usr
$(PKG)_FILE     := glib-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-glib2-2.64.2-1-any.pkg.tar.xz
$(PKG)_DEPS     := cc dbus gettext libffi libiconv pcre zlib $(BUILD)~$(PKG)

$(PKG)_DEPS_$(BUILD) := glib-bin-native

define $(PKG)_BUILD
    # other packages expect glib-tools in $(TARGET)/bin
    rm -f  '$(PREFIX)/$(TARGET)/bin/glib-*'
    ln -sf '$(PREFIX)/$(BUILD)/bin/glib-genmarshal'        '$(PREFIX)/$(TARGET)/bin/'
    ln -sf '$(PREFIX)/$(BUILD)/bin/glib-compile-schemas'   '$(PREFIX)/$(TARGET)/bin/'
    ln -sf '$(PREFIX)/$(BUILD)/bin/glib-compile-resources' '$(PREFIX)/$(TARGET)/bin/'

    # cross build
		cd $(SOURCE_DIR) &&
			cp -R ./* $(PREFIX)/$(TARGET)/
endef

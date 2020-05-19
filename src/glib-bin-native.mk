# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := glib-bin-native
$(PKG)_WEBSITE  := https://gtk.org/
$(PKG)_DESCR    := GLib bin
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.54.3
$(PKG)_CHECKSUM := eee58db035f3c9ffd5cee8ada2654fcd568607b0b28bfff09d159381a5cbbd8d
$(PKG)_SUBDIR   := usr
$(PKG)_FILE     := glib2-$($(PKG)_VERSION)-3-x86_64.pkg.tar.xz
$(PKG)_URL      := http://repo.msys2.org/msys/x86_64/glib2-2.54.3-3-x86_64.pkg.tar.xz
$(PKG)_DEPS     := cc dbus gettext libffi libiconv pcre zlib $(BUILD)~$(PKG)
$(PKG)_TARGETS  := $(BUILD) $(MXE_TARGETS)

$(PKG)_DEPS_$(BUILD) := autotools gettext libffi libiconv zlib

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/glib/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    $(SORT) -Vr | \
    head -1
endef

define $(PKG)_BUILD_NATIVE
    # native build for glib-tools
		cd $(SOURCE_DIR) && \
			cp -R ./* $(PREFIX)/$(TARGET)/
		cp /usr/bin/glib-genmarshal $(PREFIX)/$(TARGET)/
endef

define $(PKG)_BUILD_$(BUILD)
    $(if $(findstring darwin, $(BUILD)), \
        $($(PKG)_BUILD_DARWIN), \
        $($(PKG)_BUILD_NATIVE))
endef

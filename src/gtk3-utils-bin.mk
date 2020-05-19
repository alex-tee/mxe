# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gtk3-utils-bin
$(PKG)_WEBSITE  := http://www.linuxfromscratch.org/blfs/view/svn/general/libcroco.html
$(PKG)_DESCR    := gettext binary
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.24.18
$(PKG)_CHECKSUM := f4ff4c9d462e9b5ca3c2e299fa68d0c38d35383a43aea1c84d823a2cefb4dee1
$(PKG)_SUBDIR   := mingw64
$(PKG)_FILE     := gtk3-$($(PKG)_VERSION)-1-any.pkg.tar.xz
$(PKG)_URL      := http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-gtk3-3.24.18-1-any.pkg.tar.xz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/libcroco/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    head -1
endef

define $(PKG)_BUILD
	cd $(1)/bin && \
		cp -R ./gtk-update-icon-cache-3.0.exe \
		$(PREFIX)/$(TARGET)/bin/gtk-update-icon-cache.exe && \
		cp -R ./gtk-update-icon-cache-3.0.exe \
		$(PREFIX)/$(TARGET)/bin/gtk-update-icon-cache && \
		cp -R ./gtk-query-immodules-3.0.exe \
		$(PREFIX)/$(TARGET)/bin/gtk-query-immodules-3.0 && \
		cp -R ./*.exe $(PREFIX)/$(TARGET)/bin/
endef

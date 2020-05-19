# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gettext-bin
$(PKG)_WEBSITE  := http://www.linuxfromscratch.org/blfs/view/svn/general/libcroco.html
$(PKG)_DESCR    := gettext binary
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.19.8.1
$(PKG)_CHECKSUM := 0349bd137cd15ec2e3e882b1b8152ffc4bc5369999b0aa1999c6b087c34148bc
$(PKG)_SUBDIR   := mingw64
$(PKG)_FILE     := gettext-$($(PKG)_VERSION)-8-any.pkg.tar.xz
$(PKG)_URL      := http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-gettext-0.19.8.1-8-any.pkg.tar.xz
$(PKG)_DEPS     := gettext

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/libcroco/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    head -1
endef

define $(PKG)_BUILD
	cd $(1) && cp -R ./* $(PREFIX)/$(TARGET)/
endef


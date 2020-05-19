# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libcroco
$(PKG)_WEBSITE  := http://www.linuxfromscratch.org/blfs/view/svn/general/libcroco.html
$(PKG)_DESCR    := Libcroco
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.6.13
$(PKG)_CHECKSUM := 767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/libcroco/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc glib2 libxml2

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/libcroco/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(MXE_CONFIGURE_OPTS) \
        --disable-gtk-doc \
				$(if $(BUILD_STATIC),--enable-static --disable-shared,--enable-shared --disable-static)
    $(MAKE) -C '$(1)' -j '$(JOBS)' install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
endef

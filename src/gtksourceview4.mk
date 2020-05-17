# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gtksourceview4
$(PKG)_WEBSITE  := https://projects.gnome.org/gtksourceview/
$(PKG)_DESCR    := GTKSourceView
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.2.0
$(PKG)_CHECKSUM := c431eb234dc83c7819e58f77dd2af973252c7750da1c9d125ddc94268f94f675
$(PKG)_SUBDIR   := gtksourceview-$($(PKG)_VERSION)
$(PKG)_FILE     := gtksourceview-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/gtksourceview/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc gtk3 libxml2

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        --host='$(TARGET)' \
        --disable-shared \
        --prefix='$(PREFIX)/$(TARGET)' \
        --disable-gtk-doc \
        GLIB_GENMARSHAL='$(PREFIX)/$(TARGET)/bin/glib-genmarshal' \
        GLIB_MKENUMS='$(PREFIX)/$(TARGET)/bin/glib-mkenums' \
        $(shell [ `uname -s` == Darwin ] && echo "INTLTOOL_PERL=/usr/bin/perl")
    $(MAKE) -C '$(1)' -j '$(JOBS)' bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
    $(MAKE) -C '$(1)' -j 1 install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
endef

$(PKG)_BUILD_SHARED =

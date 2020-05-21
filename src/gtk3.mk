# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gtk3
$(PKG)_WEBSITE  := https://gtk.org/
$(PKG)_DESCR    := GTK+
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.24.18
$(PKG)_CHECKSUM := f5eaff7f4602e44a9ca7bfad5382d7a73e509a8f00b0bcab91c198d096172ad2
$(PKG)_SUBDIR   := gtk+-$($(PKG)_VERSION)
$(PKG)_FILE     := gtk+-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.gnome.org/sources/gtk+/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := cc atk cairo gdk-pixbuf-rsvg gettext-bin glib2 jasper jpeg libepoxy libpng pango tiff gtk3-utils-bin

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.gnome.org/GNOME/gtk+/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    grep '^3\.' | \
    grep -v '^3\.9[0-9]' | \
    head -1
endef

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && \
		cp -R /home/build/gtk/subprojects/* ./subprojects/ && \
		$(SED) -i -e "s/'-lgdi32',/'-lgdi32', '-lgdiplus',/" meson.build && \
		$(SED) -i -e "1042s/.*/if false/" gtk/meson.build && \
		$(SED) -i -e "1090s/true/true)/" gtk/meson.build && \
		$(SED) -i -e "1091s/)/endif/" gtk/meson.build && \
		$(SED) -i -e "32s/.*/'''/" build-aux/meson/post-install.py && \
		$(SED) -i -e "46s/.*/'''/" build-aux/meson/post-install.py && \
		$(SED) -i -e \
		"s/DllMain/$(if $(BUILD_STATIC),gtk_DllMain,DllMain)/g" \
		gtk/gtkwin32.c && \
		$(SED) -i -e \
		"s/DllMain/$(if $(BUILD_STATIC),gdk_DllMain,DllMain)/g" \
		gdk/win32/gdkmain-win32.c
	cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' \
		-Dman=false \
		-Dbroadway_backend=false \
		-Dwin32_enabled=true \
		-Dgtk_doc=false \
		-Dman=false \
		-Dtests=false \
		-Dinstalled_tests=false \
		-Dexamples=false \
		-Ddemos=false \
		-Dintrospection=false \
		-Dbuiltin_modules=true
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := d8c7f92
$(PKG)_CHECKSUM := 942761851303322540fa564e46c34c0739a58394378bd2eea57278f7473d20d3
$(PKG)_GH_CONF  := falkTX/Carla/branches/develop
$(PKG)_DEPS     := cc libsndfile fluidsynth carla-32-bin

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && \
		$(SED) -i -e "s|NATIVE_LINK_FLAGS) -o|NATIVE_LINK_FLAGS) -L$(PREFIX)/$(TARGET)/lib -lintl -o|g" source/plugin/Makefile source/bridges-plugin/Makefile && \
		$(SED) -i -e "s|\t@|\t|g" source/bridges-plugin/Makefile source/plugin/Makefile && \
		$(SED) -i -e "s| wine | touch |g" source/plugin/Makefile && \
		$(SED) -i -e 's|bin/carla.lv2/\*.ttl| |' Makefile
	cd '$(SOURCE_DIR)' && $(MAKE) -j '$(JOBS)' \
		CC=$(subst shared,static,$(TARGET))-gcc CXX=$(subst shared,static,$(TARGET))-g++ \
		PKG_CONFIG=$(subst shared,static,$(TARGET))-pkg-config BUILDING_FOR_WINDOWS=true
	cd '$(SOURCE_DIR)' && $(MAKE) -j 1 \
		CC=$(subst shared,static,$(TARGET))-gcc CXX=$(subst shared,static,$(TARGET))-g++ \
		PKG_CONFIG=$(subst shared,static,$(TARGET))-pkg-config BUILDING_FOR_WINDOWS=true \
		PREFIX=$(PREFIX)/$(TARGET) install
endef

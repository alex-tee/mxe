# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := c8b2c61
$(PKG)_CHECKSUM := 3800dc5efbe60103e48f19c096a4227518df2abf647b35d3bba667a4fa3ad4fd
$(PKG)_GH_CONF  := falkTX/Carla/branches/develop
$(PKG)_DEPS     := cc libsndfile fluidsynth

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && $(MAKE) -j '$(JOBS)' \
		CC=$(TARGET)-gcc CXX=$(TARGET)-g++ \
		PKG_CONFIG=$(TARGET)-pkg-config BUILDING_FOR_WINDOWS=true
	cd '$(SOURCE_DIR)' && $(MAKE) -j 1 \
		CC=$(TARGET)-gcc CXX=$(TARGET)-g++ \
		PKG_CONFIG=$(TARGET)-pkg-config BUILDING_FOR_WINDOWS=true \
		PREFIX=$(PREFIX)/$(TARGET) install
endef

# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := a20036e
$(PKG)_CHECKSUM := e34c9f1320fdf31eb5c31cd61420d945663f42208286abb0ce8597fb5b0c8dd1
$(PKG)_GH_CONF  := falkTX/Carla/branches/develop
$(PKG)_DEPS     := cc libsndfile

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && $(MAKE) -j '$(JOBS)' \
		CC=$(TARGET)-gcc CXX=$(TARGET)-g++ \
		PKG_CONFIG=$(TARGET)-pkg-config BUILDING_FOR_WINDOWS=true
	cd '$(SOURCE_DIR)' && $(MAKE) -j 1 \
		CC=$(TARGET)-gcc CXX=$(TARGET)-g++ \
		PKG_CONFIG=$(TARGET)-pkg-config BUILDING_FOR_WINDOWS=true \
		PREFIX=$(PREFIX)/$(TARGET) install
endef

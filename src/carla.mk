# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := b5ee661
$(PKG)_CHECKSUM := beb54e71b368d282ee61ec7112cb47fa4f6ae331553aec61cc120b1482528f07
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

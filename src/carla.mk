# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5c5d8c1
$(PKG)_CHECKSUM := 8f85f7b68a7c70dde2161841f35cc9cec035a3b28a3ef9adce1def9c31ffaeec
$(PKG)_GH_CONF  := falkTX/Carla/branches/develop
$(PKG)_FILE     := Carla-$($(PKG)_VERSION).zip
$(PKG)_URL      := https://github.com/falkTX/Carla/archive/$($(PKG)_VERSION).zip
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

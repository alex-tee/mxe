# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := b082b8b
$(PKG)_CHECKSUM := 057e9572ba2867a4eaddc44859a083b1ae9ea4440426fcbc753aa10d0ead7b99
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

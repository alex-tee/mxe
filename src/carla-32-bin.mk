# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla-32-bin
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla 32
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.1
$(PKG)_CHECKSUM := 952cc731f6f711ef1f16831c3b0ec957083c8944b076607073e76063d2e4c805
$(PKG)_SUBDIR   := carla-$($(PKG)_VERSION)-woe32
$(PKG)_FILE     := carla-$($(PKG)_VERSION)-woe32.zip
$(PKG)_URL      := https://www.zrythm.org/downloads/carla/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_BUILD
	cd $(1)/.. && \
		mkdir -p $(PREFIX)/$(TARGET)/lib/carla && \
		cp -R ./*.exe $(PREFIX)/$(TARGET)/lib/carla/ && \
		chmod +x $(PREFIX)/$(TARGET)/lib/carla/*.exe
endef

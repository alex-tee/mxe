# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := carla-32-bin
$(PKG)_WEBSITE  := https://github.com/falkTX/Carla
$(PKG)_DESCR    := Carla 32
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1
$(PKG)_CHECKSUM := 43f64ef9324d7a78cc4af685d3e0415e4bc49422ad412a0164e8886c3d897e06
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

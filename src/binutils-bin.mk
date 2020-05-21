# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := binutils-bin
$(PKG)_WEBSITE  := https://www.gnu.org/software/binutils/
$(PKG)_DESCR    := GNU Binutils
$(PKG)_VERSION  := 2.28
$(PKG)_CHECKSUM := e9a2bd4e5ae6ddd0b3ee9c024dba0644c33d5d74a232b8336b69c7288254819f
$(PKG)_SUBDIR   := mxe-x86-64-w64-mingw32-binutils_2.28
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.xz
$(PKG)_URL      := https://www.zrythm.org/downloads/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_BUILD
	cp -r $(SOURCE_DIR)/* $(PREFIX)/
endef

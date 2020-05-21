# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := gcc-bin
$(PKG)_WEBSITE  := https://gcc.gnu.org/
$(PKG)_DESCR    := GCC
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.5.0
$(PKG)_CHECKSUM := 76da78ad3dccf95f30a61439e7cf5ce60ef809bec7691da513a9612bbae1d1c0
$(PKG)_SUBDIR   := mxe-x86-64-w64-mingw32.shared-gcc_5.5.0
$(PKG)_FILE     := mxe-x86-64-w64-mingw32-gcc_5.5.0.tar.xz
$(PKG)_URL      := https://www.zrythm.org/downloads/$($(PKG)_FILE)
$(PKG)_DEPS     := binutils-bin mingw-w64 $(addprefix $(BUILD)~,gmp isl mpc mpfr)

define $(PKG)_BUILD
	cp -r $(SOURCE_DIR)/* $(PREFIX)/
endef

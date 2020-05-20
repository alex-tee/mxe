# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := zrythm
$(PKG)_WEBSITE  := https://www.zrythm.org
$(PKG)_DESCR    := zrythm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7483bc7a3003314f2f979665245e1599740b5dec
$(PKG)_CHECKSUM := 4da068225af2aea3b0de80e81879732ccf93d454c152a078ba40921771fcbfde
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://git.zrythm.org/cgit/zrythm/snapshot/$(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := cc libsndfile fftw gtk3 libyaml gtksourceview4 rubberband dlfcn-win32 carla librsvg zstd zplugins

# note: this assumes that the meson subprojects are
# predownloaded in
# /home/ansible/Documents/git/zrythm/subprojects

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && \
		cp -R /home/ansible/Documents/git/zrythm/subprojects/* ./subprojects/
	cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' --wrap-mode=nodownload \
		-Dwith-manpage=false \
		-Drtmidi=auto \
		-Drtaudio=auto \
		-Dcarla=enabled \
		-Dtrial-ver=false \
		-Dwindows-release=true
	cd $(SOURCE_DIR) && \
		$(SED) -i -e '45s|#|//#|' subprojects/lilv/lilv-0.24.6/src/util.c && \
		$(SED) -i -e '55s|#|//#|' subprojects/lilv/lilv-0.24.6/src/util.c
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

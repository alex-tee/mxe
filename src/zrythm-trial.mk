# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := zrythm-trial
$(PKG)_WEBSITE  := https://github.com/zrythm/zrythm
$(PKG)_DESCR    := zrythm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := c9b1f16
$(PKG)_CHECKSUM := 35d6620c533db0e60d173d3b945066e95acd9aef8703efd2d6f695ec3479b3c4
$(PKG)_GH_CONF  := zrythm/zrythm/branches/master
$(PKG)_DEPS     := cc libsndfile fftw gtk3 libyaml gtksourceview4 rubberband dlfcn-win32 carla librsvg

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && \
		cp -R /home/ansible/Documents/git/zrythm/subprojects/* ./subprojects/
	cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' --wrap-mode=nodownload \
		-Dwith-manpage=false \
		-Drtmidi=auto \
		-Drtaudio=auto \
		-Dcarla=enabled \
		-Dtrial-ver=true \
		-Dwindows-release=true
	cd $(SOURCE_DIR) && \
		$(SED) -i -e '45s|#|//#|' subprojects/lilv/lilv-0.24.6/src/util.c && \
		$(SED) -i -e '55s|#|//#|' subprojects/lilv/lilv-0.24.6/src/util.c
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

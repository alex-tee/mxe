# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := zrythm
$(PKG)_WEBSITE  := https://github.com/zrythm/zrythm
$(PKG)_DESCR    := zrythm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := e639b70
$(PKG)_CHECKSUM := 5f20061562d23611639f1fb50160994d04ad65f65f240107c250f00a676030ad
$(PKG)_GH_CONF  := zrythm/zrythm/branches/master
$(PKG)_DEPS     := cc libsndfile fftw gtk3 libyaml gtksourceview4 rubberband dlfcn-win32 carla librsvg

define $(PKG)_BUILD
	cd '$(SOURCE_DIR)' && \
		cp -R /home/ansible/Documents/git/zrythm/subprojects/* ./subprojects/
	cd '$(SOURCE_DIR)' && $(TARGET)-meson '$(BUILD_DIR)' --wrap-mode=nodownload \
		-Dwith-manpage=false \
		-Drtmidi=auto \
		-Drtaudio=auto \
		-Dcarla=disabled
	cd $(SOURCE_DIR) && \
		$(SED) -i -e '45s|#|//#|' subprojects/lilv/lilv-0.24.6/src/util.c && \
		$(SED) -i -e '55s|#|//#|' subprojects/lilv/lilv-0.24.6/src/util.c
	cd '$(SOURCE_DIR)' && ninja -C $(BUILD_DIR) install
endef

# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

EGIT_REPO_URI="https://repo.dec05eba.com/gpu-screen-recorder-gtk"

DESCRIPTION="GTK frontend for gpu-screen-recorder."
HOMEPAGE="https://git.dec05eba.com/gpu-screen-recorder-gtk/about"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	x11-libs/gtk+:3[wayland(+)] 
	dev-libs/libayatana-appindicator
	media-video/gpu-screen-recorder
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_configure() {
	meson_src_configure
}

src_install() {
	meson_src_install
}

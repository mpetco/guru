# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

MYPV="${PV/_alpha/-alpha}"

DESCRIPTION="A command line/operator for package version."
HOMEPAGE="https://github.com/azaeldevel/octetos-version"
SRC_URI="https://github.com/azaeldevel/octetos-${PN}/archive/${MYPV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

DEPEND="dev-libs/octetos-core"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/octetos-${PN}-${MYPV}"

src_prepare() {
	default
	eautoreconf -fi
}
src_configure() {
	econf --with-portage
}

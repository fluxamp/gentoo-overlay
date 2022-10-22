# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Compiler wrapper client for the Remote Execution API."
HOMEPAGE="https://buildgrid.gitlab.io/recc"
SRC_URI="https://gitlab.com/BuildGrid/recc/-/archive/${PV}/${P}.tar.bz2 -> ${P}.gl.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	~dev-cpp/buildbox-common-${PV}
"

RDEPEND="${DEPEND}"
BDEPEND=""

MYCMAKEARGS="-DBUILD_TESTING=OFF"

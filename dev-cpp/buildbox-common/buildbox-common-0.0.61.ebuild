# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Common code for buildbox and recc"
HOMEPAGE="https://gitlab.com/BuildGrid/buildbox/buildbox-common/"
SRC_URI="https://gitlab.com/BuildGrid/buildbox/buildbox-common/-/archive/${PV}/${P}.tar.bz2 -> ${P}.gl.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/glog
	net-libs/grpc
"

RDEPEND="${DEPEND}"
BDEPEND=""

MYCMAKEARGS="-DBUILD_TESTING=OFF"

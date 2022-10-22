# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 prefix

DESCRIPTION="Reference package for reflection in GRPC Python"
HOMEPAGE="https://grpc.io"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~dev-python/grpcio-tools-${PV}[${PYTHON_USEDEP}]
"
python_prepare_all() {
	distutils-r1_python_prepare_all
	hprefixify setup.py
}

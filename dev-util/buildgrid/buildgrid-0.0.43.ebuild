# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A remote execution service, implementing Google' s REAPI and RWAPI."
HOMEPAGE="https://gitlab.com/BuildGrid/buildgrid"

SRC_URI="https://gitlab.com/BuildGrid/buildgrid/-/archive/${PV}/${P}.tar.bz2 -> ${P}.gl.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/alembic
	dev-python/boto3
	dev-python/click
	dev-python/dnspython
	dev-python/grpcio
	dev-python/grpcio-reflection
	dev-python/janus
	dev-python/jsonschema
	dev-python/lark
	dev-python/protobuf-python
	dev-python/pycurl
	dev-python/pyyaml
"

BDEPEND="test? ( ${RDEPEND} )"

python_prepare_all() {
	# prevent tests package from being installed automatically
	rm tests/__init__.py

	# remove explicit dependency on pytest-runner
	sed -i -e '/pytest-runner/d' setup.py || die

	# remove custom test flags
	sed -i -e '/addopts/d' setup.cfg || die
	distutils-r1_python_prepare_all
}

distutils_enable_tests pytest

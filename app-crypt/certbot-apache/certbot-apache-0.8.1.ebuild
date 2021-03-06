# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)
inherit git-r3 distutils-r1

EGIT_REPO_URI="https://github.com/certbot/certbot.git"
EGIT_COMMIT="v${PV}"

DESCRIPTION="Apache plugin for certbot"
HOMEPAGE="https://github.com/certbot/certbot https://certbot.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="app-crypt/certbot[${PYTHON_USEDEP}]
	app-crypt/acme[${PYTHON_USEDEP}]
	www-servers/apache[ssl]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/python-augeas[${PYTHON_USEDEP}]
	dev-python/zope-component[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${P}/${PN}

src_unpack() {
	git-r3_fetch
	git-r3_checkout
}

python_test() {
	nosetests -w ${PN/-/_}/tests || die
}

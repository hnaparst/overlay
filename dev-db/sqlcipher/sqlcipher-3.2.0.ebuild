# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit flag-o-matic eutils git-r3

DESCRIPTION="Like SQLite but encrypted"
HOMEPAGE="http://sqlcipher.net/"
EGIT_REPO_URI="https://github.com/sqlcipher/sqlcipher.git"
EGIT_COMMIT="v${PV}"

LICENSE=BSD
SLOT=0

KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/openssl:0"
DEPEND="${RDEPEND}
	dev-lang/tcl"

src_configure()
{
	append-cflags -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2
	append-ldflags -lcrypto

	econf --enable-tempstore=yes
}

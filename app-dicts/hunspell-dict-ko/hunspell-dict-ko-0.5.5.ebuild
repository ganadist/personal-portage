# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils flag-o-matic multilib

DESCRIPTION="Korean spellchecking dictionary for hunspell"
HOMEPAGE="http://code.google.com/p/spellcheck-ko/"
SRC_URI="http://spellcheck-ko.googlecode.com/files/${P}.tar.gz"

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-text/hunspell"
DEPEND="${RDEPEND} dev-python/lxml"

src_compile() {
	emake
}

src_install() {
	emake dist
	SPELLDIR=/usr/share/myspell
	insinto ${SPELLDIR}
	doins ${WORKDIR}/${P}/ko.dic
	doins ${WORKDIR}/${P}/ko.aff
	dodoc CREDITS LICENSE LICENSE.GPL LICENSE.LGPL LICENSE.MPL README
}


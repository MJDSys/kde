# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde5

DESCRIPTION="ECMAScipt compatible parser and engine"
LICENSE="BSD-2 LGPL-2+"
KEYWORDS=" ~amd64"
IUSE=""

RDEPEND="
	dev-libs/libpcre
"
DEPEND="${RDEPEND}
	dev-lang/perl
"

DOCS=( src/README )

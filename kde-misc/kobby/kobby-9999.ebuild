# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit kde4-base git

DESCRIPTION="collaborative Editor for KDE"
HOMEPAGE="http://wiki.github.com/greghaynes/kobby"
EGIT_REPO_URI="git://github.com/greghaynes/kobby.git"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="
	net-libs/libqinfinity"

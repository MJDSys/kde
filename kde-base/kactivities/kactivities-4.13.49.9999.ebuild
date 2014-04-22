# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_BRANCH="KDE/4.13"
inherit kde4-base

DESCRIPTION="KDE Activity Manager"

KEYWORDS=""
IUSE="semantic-desktop"

DEPEND="
	semantic-desktop? (
		$(add_kdebase_dep nepomuk-core)
		dev-libs/soprano
	)
"
RDEPEND="
	${DEPEND}
	!kde-base/activitymanager
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with semantic-desktop NepomukCore)
	)
	kde4-base_src_configure
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_DOXYGEN="true"
KDE_TEST="forceoptional"
inherit kde5

DESCRIPTION="KDE Telepathy common library"
HOMEPAGE="https://community.kde.org/Real-Time_Communication_and_Collaboration"

LICENSE="LGPL-2.1"
KEYWORDS=""
IUSE="otr +sso"

COMMON_DEPEND="
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kpeople)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	net-libs/telepathy-logger-qt:5
	>=net-libs/telepathy-qt-0.9.5[qt5]
	otr? (
		dev-libs/libgcrypt:0=
		>=net-libs/libotr-4.0.0
	)
	sso? (
		$(add_kdeapps_dep kaccounts-integration)
		net-libs/accounts-qt
		net-libs/telepathy-accounts-signon
	)
"
DEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kio)
	$(add_qt_dep qtnetwork)
"
RDEPEND="${COMMON_DEPEND}
	!net-im/ktp-common-internals
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package doc Doxygen)
		$(cmake-utils_use_find_package sso KAccounts)
		$(cmake-utils_use_find_package sso AccountsQt5)
		$(cmake-utils_use_find_package otr Libgcrypt)
		$(cmake-utils_use_find_package otr LibOTR)
	)

	kde5_src_configure
}

src_compile() {
	kde5_src_compile
	use doc && kde5_src_compile apidox
}

src_install() {
	kde5_src_install
	use doc && dodoc "${BUILD_DIR}"/KTp/docs/html/*
}
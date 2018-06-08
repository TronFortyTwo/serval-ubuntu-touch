/*
#############################################################################
#    Serval for Ubuntu Touch												#
#    Copyright (C) 2018 Emanuele Sorce - emanuele.sorce@hotmail.com			#
#																			#
#    This program is free software; you can redistribute it and/or modify	#
#    it under the terms of the GNU General Public License as published by	#
#    the Free Software Foundation, version 3 or compatibles.				#
#																			#
#    This program is distributed in the hope that it will be useful,		#
#    but WITHOUT ANY WARRANTY; without even the implied warranty of			#
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the			#
#    GNU General Public License for more details.							#
#																			#
#    You should have received a copy of the GNU General Public License		#
#    along with this program; if not, write to the Free Software			#
#    Foundation, Inc.														#
#############################################################################
*/

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

Page {
	title: qsTr("About")
	id: about

	clip: true

	Column {
		id: col
		anchors.fill: parent

		spacing: 30

		Label {
			width: parent.width
			horizontalAlignment: Text.Center
			text: qsTr('Serval')
		}

		Image {
			width: 128
			height: 128
			source: "../assets/serval-logo.jpeg"
		}

		Button {
			id: back_button
			text: qsTr("Back")
			onClicked: {
				stackview.pop()
			}
		}
	}
}

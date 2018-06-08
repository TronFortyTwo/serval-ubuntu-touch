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
import Cxxb 1.0

Page {
	id: install
	title: qsTr('Serval')
		
	property var isinstalled: Cxxb.execbool("./checkifinstalled.sh")

	clip: true

	Column {
		id: contentColumn
		anchors.fill: parent
		anchors.rightMargin: 10
		anchors.leftMargin: 10
		anchors.topMargin: 20
		width: parent.width

		spacing: 20

		Label {
			width: parent.width
			wrapMode: Text.Wrap
			text: qsTr("QServal - This is ALPHA Software")
		}

		Label {
			id: feedback
			visible: true
			text: qsTr("")
		}

		Button {
			id: setupb
			visible: !install.isinstalled
			text: qsTr("Set up Serval")
			onClicked:
			{
				var result = Cxxb.execbool("./set-up.sh");
				if (result == true)
				{
					visible = false
					setupagainb.visible = true
					startb.visible = true
					feedback.text = qsTr("Serval set up successfully.")
					feedback.color = "green"
				}
				else
				{
					feedback.text = qsTr("Serval set up failed.")
					feedback.color = "red"
				}
			}
		}

		Button {
			id: setupagainb
			visible: install.isinstalled
			text: qsTr("Serval is already set up. Set up again?")
			onClicked:
			{
				var result = Cxxb.execbool("./set-up.sh");
				if (result == true)
				{
					feedback.text = qsTr("Serval set up successfully.")
					feedback.color = "green"
				}
				else
				{
					feedback.text = qsTr("Serval set up failed.")
					feedback.color = "red"
				}
			}
		}
		
		Button {
			text: qsTr("Start daemon")
			id: startb
			visible: install.isinstalled
			onClicked:
			{
				var result = Cxxb.execint("./startservald.sh");
				if (result == true)
				{
					feedback.text = qsTr("Servald started succefully")
					feedback.color = "green"
					visible = false
					stopb.visible = true
				}
				else if (result == 10)
				{
					feedback.text = qsTr("Servald already running")
					feedback.color = "yellow"
					visible = false
					stopb.visible = true
				}
				else
				{
					feedback.text = qsTr("Servald failed to start")
					feedback.color = "red"
				}
			}
		}

		Button {
			text: qsTr("Stop daemon")
			id: stopb
			visible: install.isinstalled
			onClicked:
			{
				var result = Cxxb.execbool("./stopservald.sh")
				if (result == true)
				{
					feedback.text = qsTr("Servald stopped succefully")
					feedback.color = "green"
					visible = false
					startb.visible = true
				}
				else
				{
					feedback.text = qsTr("Servald failed to stop")
					feedback.red = "green"
				}
			}
		}

		Button {
			id: useb
			text: qsTr("Use Serval")
			onClicked:
			{
				stackview.push("Use.qml")
			}
		}

		Button {
			id: aboutb
			text: qsTr("About")
			onClicked:
			{
				stackview.push("About.qml")
			}
		}
	}
}


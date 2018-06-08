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

import "../js/js_test.js" as Jstest

Page
{
	id: install
	title: qsTr('Serval')

	Column
	{
		spacing: 30

		Button
		{
			text: qsTr("Attemp 1")
			onClicked:
			{
				text = Jstest.test_rest()
			}
		}

		Button
		{
			text: qsTr('Back')
			onClicked:
			{
				stackview.pop()
			}
		}
	}
}

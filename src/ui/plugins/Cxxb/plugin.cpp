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

#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "cxxb.h"

void CxxbPlugin::registerTypes(const char *uri) {
    //@uri Cxxb
    qmlRegisterSingletonType<Cxxb>(uri, 1, 0, "Cxxb", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Cxxb; });
}

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

#ifndef CXXB_H
#define CXXB_H

#include <QObject>
#include <QProcess>

class Cxxb: public QObject {
	Q_OBJECT

public:
	Cxxb();
	~Cxxb() = default;

	// QML->BASH binding
	Q_INVOKABLE bool execbool(const QString&);
	Q_INVOKABLE unsigned int execint(const QString&);

private:
    //QProcess *proc;
};

#endif

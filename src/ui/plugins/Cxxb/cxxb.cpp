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

#include <QDebug>
#include <QString>

#include "cxxb.h"

Cxxb::Cxxb() {
	
}

unsigned int Cxxb::execint (const QString& cmd) {

	qDebug() << "CXXB exec: " << cmd;
	int result;

	QStringList args = cmd.split(" ");

	if (args.count() > 0)
	{
		QString program = args.takeFirst();
		result = QProcess::execute(program, args);
	}
	qDebug() << "- exit code: " << result;

	if (result == -2)
		qDebug() << "ERROR: Process " << cmd << " cannot be started";
	else if (result == -1)
		qDebug() << "ERROR: Process " << cmd << " chrashed";

	return static_cast<unsigned int>(result);
}

bool Cxxb::execbool (const QString& cmd) {

	unsigned int result = execint(cmd);

	if (result == 0)
		return true;

	return false;
}

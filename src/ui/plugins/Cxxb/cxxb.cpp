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

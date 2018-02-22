#include <QDebug>
#include <QString>

#include "cxxb.h"

Cxxb::Cxxb() {
    proc = new QProcess(this);
}

unsigned int Cxxb::execint (const QString& cmd) {

	qDebug() << "Exec: " << cmd;
	int result;

	QStringList args = cmd.split(" ");

	if (args.count() > 0)
	{
		QString program = args.takeFirst();
		proc->start(program, args);
		proc->waitForFinished();
		result = proc->exitCode();
	}
	qDebug() << "Exec: " << cmd << " | exit code: " << result;

	return result;
}

bool Cxxb::execbool (const QString& cmd) {

	unsigned int result = execint(cmd);

	if (result == 0)
		return true;

	return false;
}

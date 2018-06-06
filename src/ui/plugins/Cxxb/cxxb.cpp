#include <QDebug>
#include <QString>

#include "cxxb.h"

Cxxb::Cxxb():
	proc( new QProcess(this) )
{}

//Cxxb::~Cxxb()
//{
//	delete proc;
//}

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
		QString p_stdout = proc->readAllStandardOutput();
		QString p_stderr = proc->readAllStandardError();
	
		qDebug() << "command stdout:\n" << p_stdout;
		qDebug() << "command stderr:\n" << p_stderr;
		qDebug() << "Exit code: " << result;

		return result;
	}
	else
		return 1;
}

bool Cxxb::execbool (const QString& cmd) {

	unsigned int result = execint(cmd);

	if (result == 0)
		return true;

	return false;
}

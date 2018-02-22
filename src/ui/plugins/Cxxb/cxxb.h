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
    QProcess *proc;
};

#endif

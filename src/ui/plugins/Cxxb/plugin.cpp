#include <QtQml>
#include <QtQml/QQmlContext>

#include "plugin.h"
#include "cxxb.h"

void CxxbPlugin::registerTypes(const char *uri) {
    //@uri Cxxb
    qmlRegisterSingletonType<Cxxb>(uri, 1, 0, "Cxxb", [](QQmlEngine*, QJSEngine*) -> QObject* { return new Cxxb; });
}

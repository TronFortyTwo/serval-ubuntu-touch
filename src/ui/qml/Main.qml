import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

MainView {
	id: root
	objectName: 'mainView'
	applicationName: 'serval.emanuelesorce'
	automaticOrientation: true
	width: units.gu(200)
	height: units.gu(200)

	Install {
		id: install
	}

	About {
		id: about
	}

	PageStack {
		id: pageStack
	}

	Component.onCompleted: {
            pageStack.push(install)
	}
}

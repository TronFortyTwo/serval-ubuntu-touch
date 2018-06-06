import QtQuick 2.9
import QtQuick.Controls 2.2
import Cxxb 1.0

Page {
	id: install
	title: qsTr('Serval')
		
	property var isinstalled: Cxxb.execbool("./checkifinstalled.sh")

	clip: true

	Column {
		id: contentColumn
		anchors.fill: parent
		anchors.rightMargin: 10
		anchors.leftMargin: 10
		anchors.topMargin: 20
		width: parent.width

		spacing: 20

		Button {
			id: about_button
			text: qsTr("About")
			onClicked: {
				stackview.push("About.qml")
			}
		}

		Label {
			width: parent.width
			wrapMode: Text.Wrap
			text: qsTr("Serval daemon test. This is just for testing")
		}

		Button {
			id: setupb
			text: qsTr("Set up servald")
			onClicked: {
				Cxxb.execbool("./set-up.sh");
			}
		}
		
		Button {
			text: qsTr("Start daemon")
			id: startb
			onClicked: {
				Cxxb.execbool("./startservald.sh");
			}
		}

		Button {
			text: qsTr("Stop daemon")
			id: stopb
				
			onClicked: {
				Cxxb.execbool("./stopservald.sh")
			}
		}
	}
}


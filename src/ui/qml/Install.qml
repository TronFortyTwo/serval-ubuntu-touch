import QtQuick 2.9
import QtQuick.Controls 2.2
import Cxxb 1.0

Page {
	id: install
	title: qsTr('Serval')
	
	anchors {
		fill: parent
		margins: 5
	}
		
	property var isinstalled: Cxxb.execbool(" exit test -x '~/.cache/serval.emanuelesorce/bin/servald' ")

	clip: true

	Column {
		id: contentColumn
		anchors.fill: parent
		anchors.rightMargin: 10
		anchors.leftMargin: 10
		anchors.topMargin: 20
		width: parent.width

		spacing: 20

		Label {
			width: parent.width
			wrapMode: Text.Wrap
			text: qsTr("Serval daemon test. This is just for testing")
		}

		Button {
			id: bone
			text: qsTr("Set up servald")
			visible: !install.isinstalled
			onClicked: {
				Cxxb.execbool("set-up.sh");
				
				visible = false;
				installed.visible = true;
				btwo.visible = true;
				launchb.visible = true;
			}
		}

		Button {
			id: btwo
			text: qsTr("servald already set up. Set up again?")
			visible: install.isinstalled

			onClicked: {
				Cxxb.execbool("set-up.sh");

				installed.visible = true;
				launchb.visible = true;
			}
		}

		Label {
			id: installed
			text: qsTr("Servald set up done!");
			color: "green"
			visible: false
		}

		Rectangle {
			color: "black"
			height: 10
			width: parent.width
		}

		Label {
			id: launched
			text: qsTr("--");
			visible: false
		}

		Button {
			text: qsTr("Start daemon")
			id: launchb
			visible: install.isinstalled
			onClicked: {
				var result = Cxxb.execbool("~/.cache/serval.emanuelesorce/bin/servald start");
					
				visible = false
				launched.visible = true
				launched.text = qsTr("Servald started")
				stopb.visible = true
			}
		}

		Button {
			text: qsTr("Stop daemon")
			id: stopb
			visible: install.isinstalled
				
			onClicked: {
				var result = Cxxb.execbool("~/.cache/serval.emanuelesorce/bin/servald stop")

				visible = false
				launched.visible = true
				launched.text = qsTr ("Servald stopped")
				launchb.visible = true
			}
		}


		// SPACING
		Rectangle {
			width: parent.width
			height: 10
		}
	}
}


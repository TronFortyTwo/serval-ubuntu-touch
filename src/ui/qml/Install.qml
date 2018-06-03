import QtQuick 2.9
import QtQuick.Controls 2.2
import Cxxb 1.0

Page {
	id: install
	visible: false
	title: qsTr('Serval')
	
	Flickable {
		anchors {
			fill: parent
			margins: 20
		}

		id: flick
		
		property var isinstalled: Cxxb.execbool(" if [ ! -f ~/.cache/serval.emanuelesorce/bin/servald ]; then; exit 1 ")

		clip: true
		contentHeight: contentColumn.height + 40
		flickableDirection: Flickable.VerticalFlick

		Column {
			id: contentColumn
			anchors {
				left: parent.left
				top: parent.top
				right: parent.right
				margins: 30
			}
			width: parent.parent.width

			spacing: 20

			Label {
				width: parent.width
				wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				text: qsTr("Serval daemon test. This is just for testing")
			}

			Button {
				id: bone
				text: qsTr("Set up servald")
				visible: !flick.isinstalled
				onClicked: {
					Cxxb.execbool("sh ../set-up.sh");
					
					visible = false;
					installed.visible = true;
					btwo.visible = true;
					launchb.visible = true;
				}
			}

			Button {
				id: btwo
				text: qsTr("servald already set up. Set up again?")
				visible: flick.isinstalled

				onClicked: {
					Cxxb.execbool("sh ../set-up.sh");

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
				visible: flick.isinstalled
				onClicked: {
					var result = Cxxb.execbool("~/.cache/serval.emanuelesorce/bin/servald start");
					
					visible = false
					launched.visible = true
					launched.text = i18n.tr("Servald started")
					stopb.visible = true
				}
			}

			Button {
				text: qsTr("Stop daemon")
				id: stopb
				visible: flick.isinstalled
				
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
}


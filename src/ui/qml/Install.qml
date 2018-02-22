import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Cxxb 1.0

BasePage {
	id: install
	visible: false
	title: i18n.tr('Serval')
	
	Flickable {
        	anchors {
        	    fill: parent
        	    margins: units.gu(2)
        	}

		id: flick
		
		property var isinstalled: Cxxb.execbool(" if [ ! -f ~/.cache/serval.emanuelesorce/bin/servald ]; then; exit 1 ")

		clip: true
		contentHeight: contentColumn.height + units.gu(4)
		flickableDirection: Flickable.VerticalFlick

		Column {
			id: contentColumn
			anchors {
				left: parent.left
				top: parent.top
				right: parent.right
				margins: units.gu(2)
			}
			width: parent.parent.width

			spacing: units.gu(2)

			Label {
				width: parent.width
				wrapMode: Text.WrapAtWordBoundaryOrAnywhere
				text: i18n.tr("Serval daemon test. This is just for testing")
			}

			Button {
				id: bone
				text: i18n.tr("Set up servald")
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
				text: i18n.tr("servald already set up. Set up again?")
				visible: flick.isinstalled

				onClicked: {
					Cxxb.execbool("sh ../set-up.sh");

					installed.visible = true;
					launchb.visible = true;
				}
			}

			Label {
				id: installed
				text: i18n.tr("Servald set up done!");
				color: UbuntuColors.green
				visible: false
			}

			Rectangle {
				color: UbuntuColors.silk
				height: units.gu(1)
				width: parent.width
			}

			Label {
				id: launched
				text: i18n.tr("--");
				visible: false
			}

			Button {
				text: i18n.tr("Start daemon")
				id: launchb
				color: UbuntuColors.green
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
				text: i18n.tr("Stop daemon")
				id: stopb
				color: UbuntuColors.orange
				visible: flick.isinstalled
				
				onClicked: {
					var result = Cxxb.execbool("~/.cache/serval.emanuelesorce/bin/servald stop")

					visible = false
					launched.visible = true
					launched.text = i18n.tr ("Servald stopped")
					launchb.visible = true
				}
			}


			// SPACING
			Rectangle {
				color: UbuntuColors.silk
				width: parent.width
				height: units.gu(1)
			}

			
		}
	}
	Scrollbar {
		flickableItem: flick
		align: Qt.AlignTrailing
	}
}


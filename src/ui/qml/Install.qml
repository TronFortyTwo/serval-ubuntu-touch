import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Template 1.0

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
				text: i18n.tr("Serval daemon test. This is just for testing, don't expect it to work")
			}

			Button {
				id: bone
				text: i18n.tr("Set up servald")
				onClicked: {
					Template.execbool("sh ../set-up.sh");
					
					visible = false;
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

			Label {
				id: launched
				text: i18n.tr("Servald launched!");
				color: UbuntuColors.green
				visible: false
			}

			Button {
				text: i18n.tr("Start daemon")
				id: launchb
				color: UbuntuColors.green
				visible: false
				onClicked: {
					var result = Template.execbool("~/.cache/serval.emanuelesorce/bin/servald start");
					
					visible = false
					launched.visible = true
				}
			}
		}
	}
	Scrollbar {
		flickableItem: flick
		align: Qt.AlignTrailing
	}
}


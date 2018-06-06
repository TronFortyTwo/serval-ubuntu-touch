import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

Page {
	title: qsTr("About")
	id: about

	clip: true

	Column {
		id: col
		anchors.fill: parent

		spacing: 30

		Label {
			width: parent.width
			horizontalAlignment: Text.Center
			text: qsTr('Serval')
		}

		Image {
			width: 128
			height: 128
			source: "../assets/serval-logo.jpeg"
		}

		Button {
			id: back_button
			text: qsTr("Back")
			onClicked: {
				stackview.pop()
			}
		}
	}
}

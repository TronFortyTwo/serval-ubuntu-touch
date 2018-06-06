import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

Page {
	title: qsTr("About")
	id: about
	
	contentHeight: contentItem.childrenRect.height

	Column {
		id: col
		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right
		spacing: 30

		Label {
			width: parent.width
			horizontalAlignment: Text.Center
			text: qsTr('Serval')
		}

		RowLayout {
			width: parent.width
			Rectangle {
				Layout.alignment: Qt.AlignHCenter
				width: 256
				height: 256
				Image {
					Layout.alignment: Qt.AlignHCenter
					source: "../assets/serval-logo.jpeg"
				}
			}
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

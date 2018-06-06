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

		Label {
			width: parent.width
			wrapMode: Text.Wrap
			text: qsTr("QServal - This is ALPHA Software")
		}

		Label {
			id: feedback
			visible: true
			text: qsTr("")
		}

		Button {
			id: setupb
			visible: !install.isinstalled
			text: qsTr("Set up Serval")
			onClicked:
			{
				var result = Cxxb.execbool("./set-up.sh");
				if (result == true)
				{
					visible = false
					setupagainb.visible = true
					startb.visible = true
					feedback.text = qsTr("Serval set up successfully.")
				}
				else
				{
					feedback.text = qsTr("Serval set up failed.")
				}
			}
		}

		Button {
			id: setupagainb
			visible: install.isinstalled
			text: qsTr("Serval is already set up. Set up again?")
			onClicked:
			{
				var result = Cxxb.execbool("./set-up.sh");
				if (result == true)
				{
					feedback.text = qsTr("Serval set up successfully.")
				}
				else
				{
					feedback.text = qsTr("Serval set up failed.")
				}
			}
		}
		
		Button {
			text: qsTr("Start daemon")
			id: startb
			visible: install.isinstalled
			onClicked:
			{
				var result = Cxxb.execbool("./startservald.sh");
				if (result == true)
				{
					feedback.text = qsTr("Servald started succefully")
					visible = false
					stopb.visible = true
				}
				else
				{
					feedback.text = qsTr("Servald failed to start")
				}
			}
		}

		Button {
			text: qsTr("Stop daemon")
			id: stopb
			visible: install.isinstalled
			onClicked:
			{
				var result = Cxxb.execbool("./stopservald.sh")
				if (result == true)
				{
					feedback.text = qsTr("Servald started succefully")
					visible = false
					startb.visible = true
				}
				else
				{
					feedback.text = qsTr("Servald failed to start")
				}
			}
		}

		Button {
			id: about_button
			text: qsTr("About")
			onClicked:
			{
				stackview.push("About.qml")
			}
		}
	}
}


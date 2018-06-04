import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

ApplicationWindow {
	
	title: qsTr("Serval")
	
	id: root
	visible: true
    
	width: 800
	height: 600
	
	color: "black"
	
	StackView {
		id: stackview
		anchors.fill: parent
		initialItem: Install{}
	}
}

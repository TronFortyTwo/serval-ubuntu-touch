import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: root
    visible: true
    
    width: 600
	height: 400
	
	color: "white"
    
    Install {
        id: install
    }
 
    About {
		id: about
	}

	StackView {
		id: stackview
	}
	
	Component.onCompleted: {
        stackview.push(install)
	}
}

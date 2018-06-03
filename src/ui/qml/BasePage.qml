import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: basepage

    head.actions: [
        Action {
            iconName: "info"
            text: qsTr("About")
            onTriggered: {
                pageStack.push(about);
            }
        }
    ]
}

import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.1

Page {
   title: i18n.tr("About")
   id: about
   visible: false

   Flickable {
      id: flickable
      anchors  {
          fill: parent
          margins: units.gu(2)
      }
      contentHeight: contentItem.childrenRect.height

      Column {
         id: col
         anchors.top: parent.top
         anchors.left: parent.left
         anchors.right: parent.right
         anchors.margins: units.gu(2)
         spacing: units.gu(3)

         Label {
            width: parent.width
            horizontalAlignment: Text.Center
            text: i18n.tr('Serval')
            fontSize: "x-large"
         }

         RowLayout {
            width: parent.width
            UbuntuShape {
               Layout.alignment: Qt.AlignHCenter
               width: units.gu(128)
               height: units.gu(128)
               image: Image {
                  source: "../assets/serval-logo.jpeg"
               }
            }
         }
      }
   }
}

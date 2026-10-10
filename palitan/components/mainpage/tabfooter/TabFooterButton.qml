import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Lomiri.Components 1.3 as UT

TabButton {
    id: tabFooterButton
    
    property alias iconName: icon.name
    
    anchors{
        top: parent.top
        bottom: parent.bottom
    }

    contentItem: GridLayout {
        columns: 2
        anchors{
            top: parent.top
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        
        UT.Icon {
            id: icon
            
            Layout.preferredWidth: 20
            Layout.preferredHeight: Layout.preferredWidth
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: checked ? theme.normal.foregroundText : theme.disabled.foregroundText
        }
        
        Label {
            id: label
            
            Layout.fillWidth: true
            text: tabFooterButton.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: tabFooterButton.width > 110 //!truncated
            elide: Text.ElideRight
            maximumLineCount: 1
            font.pixelSize: 15
            color: checked ? theme.normal.foregroundText : theme.disabled.foregroundText
        }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import "../common"

BaseDialog {
    id: externalDialog
    
    property string externalURL
    
    title: i18n.tr("Open external link")
    height: 250
    
    onAccepted: {
        Qt.openUrlExternally(externalURL)
    }
    
    Column{
        spacing: 20
        anchors{
            left: parent.left
            right: parent.right
        }
        
        Label {
            text: i18n.tr("You are about to open an external link. Do you wish to continue?")
            anchors {
                left: parent.left
                right: parent.right
            }
            wrapMode: Text.Wrap
        }
        
        Label {
            text: externalURL
            font.weight: Font.Medium
            elide: Text.ElideRight
            maximumLineCount: 2
            wrapMode: Text.Wrap
            anchors {
                left: parent.left
                right: parent.right
            }
        }
    }
    
    
}

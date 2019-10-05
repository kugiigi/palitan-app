import QtQuick 2.9
import QtQuick.Controls 2.2

Column{
    id: headerLabels
    
    property alias currencyCode: codeLabel.text
    property alias currencyName: nameLabel.text
    
//~     anchors.verticalCenter: parent.verticalCenter
                
    Label{
        id: codeLabel
        
        font.pixelSize: 25
        height: font.pixelSize
        color: theme.normal.activity
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors{
            left: parent.left
            right: parent.right
        }
    }
    
    Label{
        id: nameLabel
            
        font.pixelSize: 10
        height: font.pixelSize
        color: theme.normal.backgroundTertiaryText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Label.ElideRight
        maximumLineCount: 1
        anchors{
            left: parent.left
            right: parent.right
        }
    }
}

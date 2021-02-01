import QtQuick 2.9
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT

Item{
    id: flipableSurfaceHeader
    
    readonly property real spacing: 5    
    
    HeaderLabels{
        id: baseColumn
        
        currencyCode: currency1.code
        currencyName: currency1.name
        
        anchors{
            right: separator.left
            rightMargin: spacing
            left: parent.left
        }
    }
    
    UT.Icon {
        id: separator
        
        implicitWidth: 20
        implicitHeight: implicitWidth
        anchors.centerIn: parent
        color: theme.normal.foregroundText
        name: "finish"
    }
    
    HeaderLabels{
        id: destinationColumn
        
        currencyCode: currency2.code
        currencyName: currency2.name
        
        anchors{
            left: separator.right
            leftMargin: spacing
            right: parent.right
        }
    }
}

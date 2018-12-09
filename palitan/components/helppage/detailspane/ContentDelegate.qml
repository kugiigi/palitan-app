import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "contentdelegate"


Flickable{
    id: contentDelegate
    
    contentHeight: contentColumn.height + contentColumn.anchors.margins
    boundsBehavior: Flickable.DragOverBounds
    clip: true

    ScrollIndicator.vertical: ScrollIndicator { }
    
    ColumnLayout{
        id: contentColumn
        
        spacing: 10
        
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 20
        }
        
        PaneHeader{}
        
        ColumnLayout{
            Repeater {
                model: content
            
                delegate: Delegate{}
            }
        }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2

Pane{
    id: basePane
    
    property var actions: []
    property string inputTextValue
    property Flickable flickable
    property string label
    property string iconName
    
    padding: 0
}

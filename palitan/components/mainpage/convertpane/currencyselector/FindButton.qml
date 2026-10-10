import QtQuick.Controls 2.2
import Lomiri.Components 1.3 as UT

ToolButton{
    id: findButton
    
    flat: true
    height: width
    focusPolicy: Qt.NoFocus
    
    UT.Icon {
        id: icon
        
        implicitWidth: 20
        implicitHeight: implicitWidth
        anchors.centerIn: parent
        color: theme.normal.foregroundText
        name: "find"
    }
    onClicked: findDialog.openDialog(role)
}

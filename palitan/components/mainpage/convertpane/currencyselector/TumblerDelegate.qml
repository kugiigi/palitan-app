import QtQuick 2.9
import QtQuick.Controls 2.2

AbstractButton {
    id: tumblerDelegate
    
    property bool highlighted: Math.abs(Tumbler.displacement) < 0.1
    property alias itemText: mainText.text
    
    focusPolicy: Qt.NoFocus
    opacity: 1 - ((1.6 * Math.abs(Tumbler.displacement)) / (Tumbler.tumbler.visibleItemCount - 1))
    width: parent.width

    onClicked: {
        Tumbler.tumbler.currentIndex = index
    }
    
    Label{
        id: mainText
        
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        maximumLineCount: 1
        anchors.fill: parent
        font.pixelSize: highlighted ? 30 : 15
        color: highlighted ? theme.normal.activity : theme.normal.backgroundText
    }
    
}

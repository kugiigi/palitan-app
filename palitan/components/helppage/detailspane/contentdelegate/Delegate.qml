import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout{
    id: delagate
    
    spacing: 3
    
    Label{
        Layout.fillWidth: true
        
        text: header
        font.pixelSize: 20
        elide: Text.ElideRight
    }
    
    Label{
        Layout.fillWidth: true
        
        text: descr
        font.pixelSize: 15
        wrapMode: Text.Wrap
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Components 1.3 as UT


RowLayout{
    
    id: delegateSurface


    readonly property real surfaceMargins: 5
    readonly property bool showCurrencyCode: settings.currencyFormatting !== 1
    
    anchors{
        left: parent.left
        right: parent.right
        margins: surfaceMargins
    }
    
    height: parent.height
    
    ColumnLayout{
        id: headerLabels
        
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        Layout.fillHeight: true
        Layout.preferredWidth: parent.width * 0.25
        Layout.maximumWidth: Layout.preferredWidth
        Layout.minimumWidth: Layout.preferredWidth
        
        spacing: 0
                    
        Label{
            id: codeLabel
            
            text: currency2.code
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 15
            color: theme.normal.activity
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        
        Label{
            id: nameLabel
                
            text: currency2.name
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 10
            color: theme.normal.backgroundTertiaryText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Label.ElideRight
            maximumLineCount: 1
        }
    }
    
    UT.Icon {
        id: separator
        
        Layout.preferredWidth: 15
        Layout.preferredHeight: Layout.preferredWidth
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        color: theme.normal.base
        name: "finish"
        
        transform:  Rotation {
            angle: !flipable.flipped ? 180 : 0
            origin.x: separator.width / 2
            origin.y: separator.height / 2
        }
    }
    
    RowLayout{
        id: resultRow
        
        Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.topMargin: 10
        
        spacing: 1
        
        Label{
            id: valueLabel2
            
            text: flipable.flipped ? currency2.convert(currency1.code) : currency1.convert(currency2.code)
            font.pixelSize: 15
            horizontalAlignment: Text.AlignRight
            color: theme.normal.positive
            fontSizeMode: Text.HorizontalFit
            minimumPixelSize: 10
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }
        
        Label{
            id: codeLabel2
            
            text: flipable.flipped ? currency1.code : currency2.code
            visible: showCurrencyCode
            font.pixelSize: 10
            horizontalAlignment: Text.AlignRight
            color: theme.normal.positive
            Layout.preferredWidth: 25
            Layout.alignment: Qt.AlignBaseline
        }
    }
}


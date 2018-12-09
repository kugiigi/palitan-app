import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

        
RowLayout{
    id: labelLabel
    
    property alias pixelSize: valueLabel.font.pixelSize
    readonly property bool showCurrencyCode: settings.currencyFormatting !== 1
    
    Layout.maximumWidth: parent.width
    Layout.fillWidth: false
    Layout.preferredHeight: 50
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    spacing: 0
    
    
    Label{
        id: valueLabel
        
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
        text: baseCurrency.convert(destinationCurrency.code)
        color: theme.normal.positive
        horizontalAlignment: Text.AlignHCenter
        elide: Label.ElideRight
        fontSizeMode: Text.HorizontalFit
        font.pixelSize: 50
        minimumPixelSize: 20
        font.weight: Font.Medium
    }
    
    Label{
        id: codeLabel
        
        Layout.preferredWidth: 35
        Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
        horizontalAlignment: Text.AlignRight
        visible: showCurrencyCode
        text: destinationCurrency.code
        color: theme.normal.positive
        font.pixelSize: 15
        font.weight: Font.Medium
    }
}

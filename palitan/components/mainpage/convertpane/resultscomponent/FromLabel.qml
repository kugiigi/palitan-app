import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
        
RowLayout {
    id: fromLabel
    
    readonly property bool showCurrencyCode: settings.currencyFormatting !== 1
    
    Layout.maximumWidth: parent.width
    Layout.fillWidth: false
    Layout.preferredHeight: 15
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    spacing: 0
    
    
    Label {
        id: valueLabel
        
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
        text: baseCurrency.formattedValue()
        color: theme.normal.foregroundText
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        elide: Label.ElideRight
        fontSizeMode: Text.HorizontalFit
        minimumPixelSize: 10
    }
    
    Label {
        id: codeLabel
        
        Layout.preferredWidth: showCurrencyCode ? 35 : 10
        Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
        text: showCurrencyCode ? baseCurrency.code + " =" : " ="
        horizontalAlignment: Text.AlignRight
        color: theme.normal.foregroundText
        font.pixelSize: 10
    }
}

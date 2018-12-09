import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

RowLayout{
    id: dataDetails
    
    Layout.alignment: Qt.AlignTop
    Layout.preferredWidth: parent.width
    Layout.preferredHeight: 10

    Label{
        id: asOfLabel
    
        Layout.alignment: Qt.AlignLeft
        
        //TODO: Causes binding loop for property width
        Layout.fillWidth: true
        //~ Layout.preferredWidth: (mainColumn.width / 2.1)// - 2.5
        Layout.preferredHeight: font.pixelSize
        text: i18n.tr("Last Updated") + ": " + Qt.formatDateTime(settings.ratesAsOfDate, "ddd, MMMM dd, yyyy")
        font.pixelSize: 10
        elide: Text.ElideRight
        color: mainModels.ratesDataModel.latest ? theme.normal.backgroundTertiaryText : theme.normal.negative
    }
    
    Label{
        id: sourceLabel
    
        Layout.alignment: Qt.AlignRight
        Layout.preferredWidth: 130//(mainColumn.width/ 2.1)// - 2.5
        Layout.preferredHeight: font.pixelSize
        text: i18n.tr("Source") + ": " + "open exchange rates"
        font.pixelSize: 10
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignRight
        color: theme.normal.backgroundTertiaryText
    }
}

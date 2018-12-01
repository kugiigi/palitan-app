import QtQuick.Layouts 1.3

ColumnLayout{
	
	property alias sortByComboBox: sortByComboBox
	property alias sortOrderComboBox: sortOrderComboBox
	
	spacing: 20
        
	anchors{
		left: parent.left
		right: parent.right
	}
	
	ComboBoxItem{
		id: sortByComboBox
		
		text: i18n.tr("By")
		model: settingsModels.sortByModel
		textRole: "text"
		Layout.alignment: Qt.AlignHCenter
	}
	
	ComboBoxItem{
		id: sortOrderComboBox
		
		text: i18n.tr("Order")
		model: settingsModels.sortOrderModel
		textRole: "text"
		Layout.alignment: Qt.AlignHCenter
	}
}

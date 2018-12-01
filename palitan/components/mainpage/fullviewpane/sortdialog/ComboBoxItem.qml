import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout {
	id: comboBoxItem
	
	property string text
	property alias currentIndex: comboBox.currentIndex
	property alias textRole: comboBox.textRole
	property alias model: comboBox.model
	
	spacing: 0
	

	Label {
		id: label
		
		text: comboBoxItem.text
		color: theme.normal.backgroundText
		Layout.alignment: Qt.AlignVCenter
	}

	ComboBox {
		id: comboBox
							
		Layout.alignment: Qt.AlignVCenter
	}
}

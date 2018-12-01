import QtQuick.Controls 2.2

ComboBox {
	id: comboBoxItem
	
	property string code: currentIndex !== -1 ? model.getValue(currentIndex, "code") : ""
	
	model: mainModels.currencyModel2
	textRole: "name"
	anchors.horizontalCenter: parent.horizontalCenter
}

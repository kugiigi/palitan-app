import QtQuick 2.9


Item{
	id: settingsModels
	
	property alias themeModel: themeModel

	BaseListModel {
		id: themeModel
		
		Component.onCompleted: fillData()

        function fillData(){
			append({"text": "Ambiance"})
			append({"text": "SuruDark"})
		}
	}
}

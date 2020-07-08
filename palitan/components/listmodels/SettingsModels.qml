import QtQuick 2.9


Item{
    id: settingsModels
    
    property alias themeModel: themeModel
    property alias sortOrderModel: sortOrderModel
    property alias sortByModel: sortByModel

    BaseListModel {
        id: themeModel
        
        Component.onCompleted: fillData()

        function fillData(){
            append({"text": "System"})
            append({"text": "Ambiance"})
            append({"text": "SuruDark"})
        }
    }
    
    BaseListModel {
        id: sortOrderModel
        
        Component.onCompleted: fillData()

        function fillData(){
            append({"text": i18n.tr("Ascending")})
            append({"text": i18n.tr("Descending")})
        }
    }
    
    BaseListModel {
        id: sortByModel
        
        Component.onCompleted: fillData()

        function fillData(){
            append({"text": i18n.tr("Name"), "id": "name"})
            append({"text": i18n.tr("Code"), "id": "code"})
        }
    }
}

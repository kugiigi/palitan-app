import QtQuick 2.9
import QtQuick.Controls 2.2
import "../components/common"
import "../components/JSONListModel"
import "../components/helppage"

BasePage {
    id: helpPage
    
    readonly property string qmlPath: "../components/helppage/"
    
    property var initialNavigation: [] 
    
    title: helpStackView.currentItem ? i18n.tr("Help") + " - " + helpStackView.currentItem.title : ""
    flickable: helpStackView.currentItem ? helpStackView.currentItem.flickable : null
    
    function deepLink(navigation){
        var obj = helpPagesRepeater.objectAt(navigation[0])
        obj.trigger("")
        helpStackView.currentItem.currentIndex = navigation[1]
    }

    
    Instantiator {
        id: helpPagesRepeater
        
        model: helpModel.model
        
        BaseAction{
            text: model.title
            iconName: model.icon
        
            onTrigger:{
                helpStackView.replace(Qt.resolvedUrl(qmlPath + model.qml), {title: model.title,contentModel: model.panes})
            }
        }
        
        onObjectAdded:{
            headerRightActions.push(object)
        }
    }
        
    StackView {
        id: helpStackView
        
        anchors.fill: parent
    }
    
    JSONListModel {
        id: helpModel
        
        source: "../../data/help.json"
        
        query: "$.help.pages[*]"
        
        onCountChanged:{
            if(count === 1){
                var initialItem = model.get(0)
                helpStackView.push(Qt.resolvedUrl(qmlPath + initialItem.qml), {title: initialItem.title, contentModel: initialItem.panes})
            }

            if(initialNavigation[0] === (count - 1)){
                deepLink(initialNavigation)
            }
        }
    }
}

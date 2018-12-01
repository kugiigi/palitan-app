import QtQuick 2.9
import QtQuick.Controls 2.2
import "../components/mainpage"
import "../components/common"

BasePage {
    id: mainPage
    
    property alias currentIndex: swipeView.currentIndex
    
    title: switch(currentIndex){
                case 0:
                    i18n.tr("Favorites")
                break;
                case 1:
                    convertPane.baseCurrency.name + " to " + convertPane.destinationCurrency.name
                break;
                case 2:
                    convertPane.baseCurrency.name
                break;
            }
    
    headerRightActions: switch(currentIndex){
            case 0: 
                [addFavoriteAction, sortFavoritesAction, updateDataAction]
                break;
            case 1: 
                [addToFavoritesAction, swapAction, updateDataAction]
                break;
            case 2: 
                [swapFullViewAction, sortFullViewAction, updateDataAction]
                break;
            default: 
                []
                break;
        }
        
    function goTo(pageName){
        switch(pageName){
            case "FAVORITES":
                tabBar.currentIndex = 0
            break
            case "CONVERT":
                tabBar.currentIndex = 1
            break
            case "FULL":
                tabBar.currentIndex = 2
            break
        }
    }
        
    BaseAction{
        id: updateDataAction
    
        text: i18n.tr("Refresh data")
        iconName: "view-refresh"
    
        onTrigger:{
            console.log("Data updated!!")
        }
    }

    //Favorites actions
    BaseAction{
        id: addFavoriteAction
    
        text: i18n.tr("Add")
        iconName: "add"
    
        onTrigger:{
            favoritesPane.showAddDialog(isBottom)
        }
    }
    
    BaseAction{
        id: sortFavoritesAction
        
        readonly property string baseText: i18n.tr("Sort") + ": "
        readonly property string sortlabel: switch(favoritesPane.sorting){
                                                case 0:
                                                    i18n.tr("Default")
                                                break
                                                case 1:
                                                    i18n.tr("Ascending")
                                                break
                                                case 2:
                                                    i18n.tr("Descending")
                                                break
                                            }
    
        text: baseText + sortlabel
        iconName: "sort-listitem"
    
        onTrigger:{
            favoritesPane.toggelSorting()
        }
    }
    
    //Convert actions
    BaseAction{
        id: addToFavoritesAction
    
        text: i18n.tr("Add to favorites")
        iconName: "starred"
    
        onTrigger:{
            var success = favoritesPane.addFavorite(convertPane.baseCurrency.code, convertPane.destinationCurrency.code)
            var tooltipText
            
            if(success){
                tooltipText = i18n.tr("Added to your favorites")
            }else{
                tooltipText = i18n.tr("Already in your favorites")
            }
            
            if(isBottom){
                tooltip.display(tooltipText, "BOTTOM")
            }else{
                tooltip.display(tooltipText, "TOP")
            }
        }
    }
    
    BaseAction{
        id: swapAction
    
        text: i18n.tr("Swap")
        iconName: "user-switch"
    
        onTrigger:{
            convertPane.swap()
        }
    }
    
    //Full view actions
    
    BaseAction{
        id: sortFullViewAction
        
        readonly property string baseText: i18n.tr("Sort") + ": "
        readonly property string sortBy: switch(settings.fullViewSortBy){
            case "name":
                i18n.tr("Name")
                break
            case "code":
                i18n.tr("Code")
                break
            default:
                i18n.tr("Name")
                break                
        }
        
        readonly property string sortOrder: switch(settings.fullViewSortOrder){
            case 0:
                i18n.tr("Asc")
                break
            case 1:
                i18n.tr("Desc")
                break
            default:
                i18n.tr("Asc")
                break                
        }
    
        text: baseText + sortBy + " (" + sortOrder + ")"
        iconName: "sort-listitem"
    
        onTrigger:{
            fullViewPane.showSortDialog(isBottom)
        }
    }
    
    BaseAction{
        id: swapFullViewAction
    
        text: i18n.tr("Swap")
        iconName: "user-switch"
    
        onTrigger:{
            fullViewPane.flippedAll = !fullViewPane.flippedAll
        }
    }
    
    //Timer to delay result while typing
    Timer {
        id: delayTimer
        
        interval: 400
        
        onRunningChanged: {
            if(running && currentIndex === 1){
                if(convertPane.baseValue != valueTextField.text)
                    convertPane.hideResult()
            }
        }
        
        onTriggered: {
            switch(currentIndex){
                case 0:
                    favoritesPane.inputTextValue = valueTextField.text
                break;
                case 1:
                    if(convertPane.baseValue != valueTextField.text){
                        convertPane.baseValue = valueTextField.text
                        settings.previousBaseCurrency = convertPane.baseCurrency.code
                        settings.previousDestinationCurrency = convertPane.destinationCurrency.code
                    }
                    convertPane.showResult()
                break;
                case 2:
                    fullViewPane.inputTextValue = valueTextField.text
                break;
            }
        }
    }
        

    SwipeView {
        id: swipeView
        
        //~ anchors.fill: parent
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: valueTextField.top
        }
        currentIndex: tabBar.currentIndex
        
        onCurrentIndexChanged:{
            tabBar.currentIndex = currentIndex
            delayTimer.restart()
                
        }

        FavoritesPane{
            id: favoritesPane
            
            //~ inputTextValue: valueTextField.text
        }
        ConvertPane{
            id: convertPane
            
            //~ baseValue: valueTextField.text
            
            onReloadData:{
                delayTimer.restart()
            }
        }
        FullViewPane{
            id: fullViewPane
            
            //~ inputTextValue: valueTextField.text
        }
    }
    
    TextField {
		id: valueTextField
		
		anchors{
			left: parent.left
			margins: 20
			right: parent.right
            bottom: parent.bottom
            bottomMargin: 10
		}
		placeholderText: "0.00"
		inputMethodHints: Qt.ImhDigitsOnly
		validator:DoubleValidator{}
		font.pixelSize: 30
		horizontalAlignment: TextInput.AlignHCenter
		text: "1"
        
        onTextChanged: {
            delayTimer.restart()
        }
	}
    
    footer: TabFooter{
        id: tabBar
    }
}

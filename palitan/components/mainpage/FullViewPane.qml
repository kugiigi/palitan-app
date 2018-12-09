import QtQuick 2.9
import QtQuick.Controls 2.2
import "../mainpage/fullviewpane"
import "../common"
import "../../library/currencies.js" as Currencies


BasePane {
    id: fullViewPane
    
    property bool flippedAll: false
    actions: [swapFullViewAction, sortFullViewAction, updateDataAction, helpAction]
    flickable: listView
    
    /****** Actions *****/
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
            showSortDialog(isBottom)
        }
    }
    
    BaseAction{
        id: swapFullViewAction
    
        text: i18n.tr("Swap")
        iconName: "user-switch"
    
        onTrigger:{
            flippedAll = !flippedAll
        }
    }
    
    BaseAction{
        id: helpAction
        
        text: i18n.tr("Help")
        iconName: "help"
    
        onTrigger:{
            //Navigate to Main Page (Full View) section in the Help Page
            stackView.gotToHelp([1,3])
        }
    }
    
    /****** Functions *****/
    
    function showSortDialog(isBottom){
        if(isBottom){
            sortDialog.openBottom()
        }else{
            sortDialog.openNormal()
        }
    }
    
    ListView {
        id: listView
        
        boundsBehavior: Flickable.DragOverBounds
        //~ snapMode: ListView.SnapToItem 
        anchors{
            top: parent.top
            topMargin: 10
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 10
        }
        spacing: 5
        model: mainModels.sortedCurrencies
        delegate: FullViewDelegate{
            flippedGlobal: flippedAll
            currency1: convertPane.baseCurrency
            currency2: Currencies.money(model, destinationValue)
            baseValue: inputTextValue ? inputTextValue : 0
            destinationValue: inputTextValue ? inputTextValue : 0
        }
        ScrollBar.vertical: ScrollBar { width: 10 }
    }
    
    SortDialog{
        id: sortDialog
    }
}

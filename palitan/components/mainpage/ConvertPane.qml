import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Components 1.3 as UT
import "../mainpage"
import "../mainpage/convertpane"
import "../common"
import "../../library/currencies.js" as Currencies

BasePane {
    id: convertPane
    
    property var baseCurrency: Currencies.money(mainModels.currencyModel2.get(baseIndex), inputTextValue)
    property var destinationCurrency: Currencies.money(mainModels.currencyModel2.get(destinationIndex), destinationValue)
    property int baseIndex
    property int destinationIndex
    property string destinationValue
    
    
    label: i18n.tr("Convert")
    iconName: "swap"
    
    signal reloadData
    
    actions:  [copyAction, addToFavoritesAction, swapAction, updateDataAction, helpAction]
    
    states: [
        State {
            name: "MINIMAL"
            when: mainPage.height < 280
            PropertyChanges { target: detailsRow; visible: false }
            PropertyChanges { target: resultsComponent.fromLabel; visible: false }
            PropertyChanges { target: currencySelector; compact: true; visible: false }
            PropertyChanges { target: valueTextField; font.pixelSize: 20 }
            PropertyChanges { target: resultsComponent.resultLabel; pixelSize: 40 }
            PropertyChanges { target: resultsComponent.exchangeRatesLabel; font.pixelSize: 10 }
        },
        State {
            name: "SMALL"
            when: mainPage.height < 365
            PropertyChanges { target: detailsRow; visible: false }
            PropertyChanges { target: resultsComponent.fromLabel; visible: false }
            PropertyChanges { target: currencySelector; compact: true; visible: true }
            PropertyChanges { target: valueTextField; font.pixelSize: 20 }
            PropertyChanges { target: resultsComponent.resultLabel; pixelSize: 40 }
            PropertyChanges { target: resultsComponent.exchangeRatesLabel; font.pixelSize: 10 }
        },
        State {
            name: "COMPACT"
            when: mainPage.height < 450
            PropertyChanges { target: detailsRow; visible: true }
            PropertyChanges { target: resultsComponent.fromLabel; visible: true }
            PropertyChanges { target: currencySelector; compact: true; visible: true }
            PropertyChanges { target: valueTextField; font.pixelSize: 30 }
            PropertyChanges { target: resultsComponent.resultLabel; pixelSize: 40 }
            PropertyChanges { target: resultsComponent.exchangeRatesLabel; font.pixelSize: 10 }
        },
        State {
            name: "NORMAL"
            when: mainPage.height > 450
            PropertyChanges { target: detailsRow; visible: true }
            PropertyChanges { target: resultsComponent.fromLabel; visible: true }
            PropertyChanges { target: currencySelector; compact: false; visible: true }
            PropertyChanges { target: valueTextField; font.pixelSize: 30 }
            PropertyChanges { target: resultsComponent.resultLabel; pixelSize: 50 }
            PropertyChanges { target: resultsComponent.exchangeRatesLabel; font.pixelSize: 15 }
        }
    ]
    
    /****** Actions *****/
    BaseAction{
        id: addToFavoritesAction
    
        text: i18n.tr("Add to favorites")
        iconName: "starred"
    
        onTrigger:{
            var success = favoritesPane.addFavorite(baseCurrency.code, destinationCurrency.code)
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
            swap()
        }
    }
    
    BaseAction{
        id: copyAction
        
        text: i18n.tr("Copy result")
        iconName: "edit-copy"
    
        onTrigger:{
            UT.Clipboard.push(resultMimeData)
        }
    }
    
    BaseAction{
        id: helpAction
        
        text: i18n.tr("Help")
        iconName: "help"
    
        onTrigger:{
            //Navigate to Main Page (Convert) section in the Help Page
            stackView.gotToHelp([1, 1])
        }
    }
    
    /****** Functions *****/
    
    function swap(){
        var a = currencySelector.baseIndex
        var b = currencySelector.destinationIndex
                    
        currencySelector.baseIndex = b
        currencySelector.destinationIndex = a
    }
    
    function setCurrencies(code1, code2){
        if(code1){
            currencySelector.baseIndex = currencySelector.model.find(code1, "code")
        }
        if(code2){
            currencySelector.destinationIndex = currencySelector.model.find(code2, "code")
        }
    }
    
    function showResult(){
        resultsComponent.show()
    }
    
    function hideResult(){
        resultsComponent.opacity = 0
    }
    
    //Used for delaying processing when changing the currency values from the Tumbler to avoid unnecessary processing
    function syncCurrencies(){
        baseIndex = currencySelector.baseIndex
        destinationIndex = currencySelector.destinationIndex
    }
    
    UT.MimeData {
        id: resultMimeData
        
        text: baseCurrency.convertedValue
    }
    
    Item {
        // Added to avoid contentWidth loop warning in MainPage
        anchors.fill: parent

        ColumnLayout{
            id: mainColumn
            
            anchors.fill: parent
            anchors.margins: 10
        
            DataDetails{
                id: detailsRow
            }
            
            ResultsComponent{
                id: resultsComponent
            }
            
            CurrencySelector{
                id: currencySelector
                
                onBaseIndexChanged: delayTimer.restart()
                onDestinationIndexChanged: delayTimer.restart()
            }
        }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import "../components/mainpage"
import "../components/common"

BasePage {
    id: mainPage
    
    property alias currentIndex: swipeView.currentIndex
    flickable: swipeView.currentItem.flickable
    
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
    
    headerRightActions: swipeView.currentItem.actions
        
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
            mainModels.ratesDataModel.fetchLatestJSON(function(success){
                    var tooltipText
                    
                    if(success){
                        tooltipText = i18n.tr("Data successfully updated")
                    }else{
                        tooltipText = i18n.tr("Failed. Please try again.")
                    }
                    
                    if(isBottom){
                        tooltip.display(tooltipText, "BOTTOM")
                    }else{
                        tooltip.display(tooltipText, "TOP")
                    }
                })
        }
    }
    
    //Timer to delay result while typing
    Timer {
        id: delayTimer
        
        interval: 400
        
        onRunningChanged: {
            if(running && currentIndex === 1){
                if(convertPane.inputTextValue != valueTextField.text)
                    convertPane.hideResult()
            }
        }
        
        onTriggered: {
            var currentValue = swipeView.currentItem.inputTextValue
            var newValue = valueTextField.text
            
            if(currentValue != newValue){
                swipeView.currentItem.inputTextValue = newValue
            }
            
            convertPane.syncCurrencies()
            
            if(currentIndex === 1){
                settings.previousBaseCurrency = convertPane.baseCurrency.code
                settings.previousDestinationCurrency = convertPane.destinationCurrency.code
                convertPane.showResult()
            }
        }
    }
    
    DataLoadingDisplay{
        id: loadingDisplay
        
        display: mainModels.ratesDataModel.loading
    }
        

    SwipeView {
        id: swipeView
        
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
        }
        ConvertPane{
            id: convertPane
            
            onReloadData:{
                delayTimer.restart()
            }
        }
        FullViewPane{
            id: fullViewPane
        }
    }
    
    TextField {
        id: valueTextField
        
        Rectangle{
            color: theme.normal.foreground
            z: -1
            anchors{
                fill: parent
                margins: -parent.anchors.margins
                topMargin: -parent.anchors.bottomMargin
                bottomMargin: -parent.anchors.bottomMargin
            }
        }
        
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

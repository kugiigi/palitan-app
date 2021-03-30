import QtQuick 2.9
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT
import "../components/mainpage"
import "../components/common"

BasePage {
    id: mainPage
    
    property alias currentIndex: swipeView.currentIndex
    flickable: swipeView.currentItem.flickable
    
    // Avoid binding loop warning
    implicitWidth: parent.width
    
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

    function focusTextField() {
        valueTextField.forceActiveFocus()
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

    SwipeView {
        id: swipeView
        
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: valueTextField.top
            bottomMargin: 20
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
        rightPadding: pasteButton.width + 5
        focus: true
        
        onTextChanged: {
            delayTimer.restart()
        }
        
        Button {
            id: pasteButton
            
            focusPolicy: Qt.NoFocus
            // TODO: Check why false intially even when there's text in the clipboard
            // visible: valueTextField.canPaste
            width: 30
        
            flat: true
            
            anchors{
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                margins: 5
            }
            
            onClicked: {
                valueTextField.selectAll()
                valueTextField.paste()
            }
            
            UT.Icon {
                id: icon
                                         
                implicitWidth: 20
                implicitHeight: implicitWidth
                anchors.centerIn: parent
                name: "edit-paste"
            }
        }
    }
    
    footer: TabFooter{
        id: tabBar
    }
}

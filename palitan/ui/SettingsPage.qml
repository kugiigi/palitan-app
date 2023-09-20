import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../components/common"
import "../components/listmodels"
import "../components/settingspage"

BasePage {
    id: settingsPage
    
    title: i18n.tr("Settings")
    flickable: settingsFlickable
    
    headerRightActions: [
            BaseAction{
                text: i18n.tr("Help")
                iconName: "help"
            
                onTrigger:{
                    //Navigate to Settings Page section in the Help Page
                    stackView.gotToHelp([2, 0])
                }
            }
        ]
    
    
    Flickable {
        id: settingsFlickable
        
        anchors.fill: parent
        contentHeight: settingsColumn.implicitHeight + (settingsColumn.anchors.margins * 2)
        boundsBehavior: Flickable.DragOverBounds

        ScrollIndicator.vertical: ScrollIndicator { }
        
        function moveScroll(newY){
            contentY = newY
        }
    
        Column {
            id: settingsColumn
            
            spacing: 10
            
            anchors{
                fill: parent
                margins: 25
            }

            
            ComboBoxItem{       
                id: themeSettings
                        
                text: i18n.tr("Theme")
                model: settingsModels.themeModel
                currentIndex: model.find(settings.currentTheme, "text")
                
                onCurrentIndexChanged:{
                        settings.currentTheme = model.get(currentIndex).text
                }
            }

            CheckBoxItem {
                text: i18n.tr("Header expansion")
                checkState: settings.enableHeaderExpand ? Qt.Checked : Qt.Unchecked
                onCheckStateChanged: {
                    switch (checkState) {
                        case Qt.Checked:
                            settings.enableHeaderExpand = true
                            break;
                        case Qt.Unchecked:
                            settings.enableHeaderExpand = false
                            break;
                    }
                }
            }
            
            ComboBoxItem{       
                id: homeCurrencySettings
                        
                currentIndex: model.find(settings.homeCurrency, "code")
                text: i18n.tr("Home currency")
                textRole: "name"
                model: mainModels.currencyModel2
                
                onCurrentIndexChanged:{
                    settings.homeCurrency = model.get(currentIndex).code
                }
            }
            
            ComboBoxItem{       
                id: alternateCurrencySettings
                        
                currentIndex: model.find(settings.alternateCurrency, "code")
                text: i18n.tr("Alternate currency")
                textRole: "name"
                model: mainModels.currencyModel2
                
                onCurrentIndexChanged:{
                    settings.alternateCurrency = model.get(currentIndex).code
                }
            }
            
            RadioButtonsItem{
                id: currencyFormatSettings
                
                text: i18n.tr("Currency format")
                model: [i18n.tr("None"), i18n.tr("Native"), i18n.tr("Home currency"), i18n.tr("Alternate currency")]
                currentIndex: settings.currencyFormatting
                
                onCurrentIndexChanged: {
                    settings.currencyFormatting = currentIndex
                }
                
                contentHeight: customPrecision.visible ? 140  + customPrecision.height : 140
                
                CustomPrecision{
                    id: customPrecision
                    
                    visible: settings.currencyFormatting > 0
                    anchors{
                        top: currencyFormatSettings.mainContent.bottom
                        topMargin: 10
                    }
                }

            }
            
            
            RadioButtonsItem{
                id: startingCurrenciesSettings
                
                text: i18n.tr("Starting currencies")
                model: [i18n.tr("Restore from previous session"), i18n.tr("Home currency and Alternate Currency"), i18n.tr("First and second in the list")]
                currentIndex: settings.startingCurrencies
                
                onCurrentIndexChanged: {
                    settings.startingCurrencies = currentIndex
                }
            }
        }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../components/common"
import "../components/listmodels"
import "../components/settingspage"

BasePage {
    id: settingsPage
    
    title: i18n.tr("Settings")
    
    headerRightActions: [
			BaseAction{
				text: i18n.tr("Help")
				iconName: "help"
			
				onTrigger:{
					console.log("help!!!")
				}
			}
		]
    
    
    Flickable {
		
        anchors.fill: parent
        contentHeight: settingsColumn.implicitHeight + (settingsColumn.anchors.margins * 2)
        flickableDirection: Flickable.AutoFlickIfNeeded

        ScrollIndicator.vertical: ScrollIndicator { }
	
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
			
			//~ CheckBoxItem{
				//~ text: i18n.tr("Use native currency formats")
				//~ checked: settings.useNativeFormat
				//~ onCheckedChanged: settings.useNativeFormat = checked
			//~ }
			
			RadioButtonsItem{
				id: currencyFormatSettings
				
				text: i18n.tr("Currency format")
				model: [i18n.tr("None"), i18n.tr("Native"), i18n.tr("Home currency"), i18n.tr("Alternate currency")]
				currentIndex: settings.currencyFormatting
				
				onCurrentIndexChanged: {
					settings.currencyFormatting = currentIndex
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

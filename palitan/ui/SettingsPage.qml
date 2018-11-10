import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../components/listmodels"

Page {
    id: settingsPage
    
    title: i18n.tr("Settings")
    
    SettingsModels{
		id: settingsModels
	}
    
	
	Column {
            id: settingsColumn
            
            spacing: 10
            
            anchors{
				fill: parent
				margins: 25
			}

            RowLayout {
                spacing: 10
                width: parent.width

                Label {
                    text: i18n.tr("Theme") + ":"
                    Layout.preferredWidth: 100
                }

                ComboBox {
                    id: styleBox
                    
                    currentIndex: model.find(settings.currentTheme, "text")//find(settings.currentTheme, Qt.MatchExactly)
                    textRole: "text"
                    model: settingsModels.themeModel
					Component.onCompleted: {
			//console.log(settings.currentTheme + " - " + find(settings.currentTheme, Qt.MatchExactly))
						//~ currentIndex = find(settings.currentTheme, Qt.MatchExactly)
					}
                    onCurrentIndexChanged:{
						settings.currentTheme = model.get(currentIndex).text
					}
                    Layout.fillWidth: true
                }
            }
            RowLayout {
                spacing: 10
                width: parent.width

                Label {
                    text: i18n.tr("Home Currency") + ":"
                    Layout.preferredWidth: 100
                }

                ComboBox {
                    id: homeCurrencyBox
                    
                    currentIndex: model.find(settings.homeCurrency, "code")
                    textRole: "name"
                    //~ editable: true
                    model: mainModels.currencyModel2
                    
                    onCurrentIndexChanged: {
						settings.homeCurrency = model.get(currentIndex).code
					}
                                        
                    Layout.fillWidth: true
                }
            }
            RowLayout {
                spacing: 10
                width: parent.width

                Label {
                    text: i18n.tr("Alternate Currency") + ":"
                    Layout.preferredWidth: 100
                }

                ComboBox {
                    id: alternateCurrencyBox
                    
                    currentIndex: model.find(settings.alternateCurrency, "code")
                    textRole: "name"
                    //editable: true
                    model: mainModels.currencyModel2
                    
                    onCurrentIndexChanged: {
						settings.alternateCurrency = model.get(currentIndex).code
					}
                                        
                    Layout.fillWidth: true
                }
            }
            GroupBox {
	            title: i18n.tr("Starting currencies") + ":"
	            width: parent.width
	
	            Column {
	                spacing: 20
	                width: parent.width
	
	                RadioButton {
						readonly property int index: 0
	                    text: i18n.tr("Restore from previous session")
	                    width: parent.width
	                    checked: settings.startingCurrencies == index
	                    onCheckedChanged: {
							if(checked){
								settings.startingCurrencies = index
							}
						}
	                }
	                RadioButton {
						readonly property int index: 1
	                    id: button
	                    text: i18n.tr("Home currency and Alternate Currency")
	                    width: parent.width
	                    checked: settings.startingCurrencies == index
	                    onCheckedChanged: {
							if(checked){
								settings.startingCurrencies = index
							}
						}
	                }
	                RadioButton {
						readonly property int index: 2
	                    text: i18n.tr("First and second in the list")
	                    width: parent.width
	                    checked: settings.startingCurrencies == index
	                    onCheckedChanged: {
							if(checked){
								settings.startingCurrencies = index
							}
						}
	                }
	            }
			}
        }
}

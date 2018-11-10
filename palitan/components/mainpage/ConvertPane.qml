import QtQuick 2.9
import QtQuick.Controls 2.2
import "../mainpage"
import "../mainpage/convertpane"
import "../common"
import "../../library/currencies.js" as Currencies

Pane {
	id: convertPane
	
	//property string conversion: baseCurrencyTumbler.currentCurrency.code + "-" + destinationCurrencyTumbler.currentCurrency.code
	
	property var baseCurrency: Currencies.currency(mainModels.currencyModel2.get(baseCurrencyTumbler.currentIndex))
	property var destinationCurrency: Currencies.currency(mainModels.currencyModel2.get(destinationCurrencyTumbler.currentIndex))
	
	Component.onCompleted: {
		updateRate()
	}
	
	//~ onConversionChanged:{
		//~ delayTimer.restart()
	//~ }
	
	onBaseCurrencyChanged: {
		delayTimer.restart()
	}
	
	onDestinationCurrencyChanged: {
		delayTimer.restart()
	}
	
	function updateRate(forceUpdate) {
		//mainView.headerTitle = baseCurrency.name + " to " + destinationCurrency.name
            var ratesData = mainModels.ratesDataModel.data
            if(ratesData && !forceUpdate){
                var base = baseCurrency.code
                var destination = destinationCurrency.code
                var result

				exchangeRatesLabel.destinationValue = (1 / ratesData.rates[base]) * ratesData.rates[destination];
                result = (valueTextField.text / ratesData.rates[base]) * ratesData.rates[destination];
                
                if(!isNaN(result)){
					resultLabel.isValid = true
					resultLabel.text = destinationCurrency.formattedMoney(result)
					//~ resultLabel.text = result
				}else{
					resultLabel.isValid = false
					resultLabel.text = i18n.tr("Invalid input. Please try again.")
				}
				
				settings.previousBaseCurrency = base
				settings.previousDestinationCurrency = destination
            }else{
                mainModels.ratesDataModel.fetchLatestJSON();
            }
    }
	
	Column {
        spacing: convertPane.height < 400 ? 0 : 20//parent.height < 200 ? 0 : 20
        anchors{
            //top: parent.top
            //bottom: parent.bottom
            //topMargin: units.gu(5)
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: units.gu(5)
            right: parent.right
            rightMargin: units.gu(5)
        }
        
        Column{
			width: parent.width
			spacing: 5
			Label{
				id: asOfLabel
				
				property bool isUpdated: new Date() === new Date(settings.ratesAsOfDate)
			
				visible: convertPane.height < 400 ? false : true
				text: i18n.tr("As of") + ": " + Qt.formatDateTime(settings.ratesAsOfDate, "MMMM dd, yyyy")
				font.pixelSize: 15
				//~ font.italic: true
				fontSizeMode: Text.Fit
				minimumPixelSize: 10
				height: 15
				width: parent.width
				horizontalAlignment: Text.AlignHCenter
				color: isUpdated ? theme.normal.backgroundTertiaryText : theme.normal.negative
			}
        
	        Label{
				id: exchangeRatesLabel
			
				property real destinationValue
			
				text: "1 " + baseCurrency.code + " = " + destinationValue + " " + destinationCurrency.code
				font.pixelSize: convertPane.height < 400 ? 15 : 20//units.gu(5)
				fontSizeMode: Text.Fit
				minimumPixelSize: 10
				height: 20//convertPane.height < 400 ? 15 : 20//units.gu(5)
				width: parent.width
				horizontalAlignment: Text.AlignHCenter
				//~ font.weight: Font.Medium
			}
		}
        
        
        Column{
			width: parent.width
			spacing: 5
			Label {
	            id: fromLabel
	                
				property bool isValid: true
				
				visible: convertPane.height < 400 ? false : true
				width: parent.width
				text: baseCurrency.formattedMoney(valueTextField.text) + " ="
				font.pixelSize: 15 //convertPane.height < 400 ? 20 : 25
				horizontalAlignment: TextInput.AlignHCenter
				verticalAlignment: TextInput.AlignVCenter
				fontSizeMode: Text.Fit
				minimumPixelSize: 20
				height: 25
				font.weight: Font.Medium
			}
			Label {
	            id: resultLabel
	                
				property bool isValid: true
				
				width: parent.width// - destinationCurrencyTumbler.width - row.spacing
				//~ text: Math.round((valueTextField.text * 53.52) * 100)/100 //mainModels.currencyModel.get(destinationCurrencyTumbler.currentIndex).name
				//anchors.verticalCenter: parent.verticalCenter
				font.pixelSize: convertPane.height < 400 ? 40 : 50 //units.gu(5)
				horizontalAlignment: TextInput.AlignHCenter
				verticalAlignment: TextInput.AlignVCenter
				fontSizeMode: Text.Fit //Fit //Text.HorizontalFit
				minimumPixelSize: 20
				height: 50//convertPane.height < 400 ? 80 : 100 //units.gu(5)
				color: isValid ? theme.normal.positive : theme.normal.negative //"#3EB34F" : "#ED3146"
				font.weight: Font.Medium
			}
		}
        
            
            
		TextField {
			id: valueTextField
			
			width: parent.width// - baseCurrencyTumbler.width - row.spacing
			placeholderText: "0.00"//mainModels.currencyModel.get(baseCurrencyTumbler.currentIndex).code
			inputMethodHints: Qt.ImhDigitsOnly
			//anchors.verticalCenter: parent.verticalCenter
			font.pixelSize: convertPane.height < 400 ? 20 : 30//units.gu(5)
			horizontalAlignment: TextInput.AlignHCenter
			text: "1"
			
			onTextChanged: {
				delayTimer.restart()
			}
				
			//Timer to delay result while typing
			Timer {
				id: delayTimer
				
				interval: 400
				onTriggered: {
					convertPane.updateRate()
				}
			}
        }

        
        Row{
            id: row
            
            //width: parent.width
            spacing: 30//units.gu(5)
            anchors.horizontalCenter: parent.horizontalCenter
            
            TumblerMouse {
                id: baseCurrencyTumbler

				//property string currentCurrencyCode: mainModels.currencyModel.get(baseCurrencyTumbler.currentIndex).code
				//~ property var currentCurrency: Currencies.currency(mainModels.currencyModel2.get(currentIndex))
				
				currentIndex: switch(settings.startingCurrencies){
									case 0:
									model.find(settings.previousBaseCurrency, "code")
									break
									case 1:
									model.find(settings.homeCurrency, "code")
									break
									case 2:
									0
									break
									default:
									0
									break
								}
                width: 70//parent.width * 0.40
                model: mainModels.currencyModel2
                delegate: TumblerDelegate {
					itemText: code
                }
            }
            SwapButton{
				id: swapButton
				
				anchors.verticalCenter: parent.verticalCenter
				onClicked:{
					var a = baseCurrencyTumbler.currentIndex
					var b = destinationCurrencyTumbler.currentIndex
					
					baseCurrencyTumbler.currentIndex = b
					destinationCurrencyTumbler.currentIndex = a
				}
			}
            TumblerMouse {
                id: destinationCurrencyTumbler

				//property string currentCurrencyCode: mainModels.currencyModel.get(destinationCurrencyTumbler.currentIndex).code
				//~ property var currentCurrency: Currencies.currency(mainModels.currencyModel2.get(destinationCurrencyTumbler.currentIndex))
				
                width: 70//parent.width * 0.40
                model: mainModels.currencyModel2
                currentIndex: switch(settings.startingCurrencies){
									case 0:
									model.find(settings.previousDestinationCurrency, "code")
									break
									case 1:
									model.find(settings.alternateCurrency, "code")
									break
									case 2:
									1
									break
									default:
									1
									break
								}
                delegate: TumblerDelegate {
					itemText: code
                }
            }
        }
    }
}

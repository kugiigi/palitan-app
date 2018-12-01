import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../../../common"

TumblerMouse {
    id: baseCurrencyTumbler
    
    readonly property string restoreValue: switch(role){
                            case "BASE":
                                settings.previousBaseCurrency
                                break
                            case "DESTINATION":
                                settings.previousDestinationCurrency
                                break
                            default:
                                settings.previousBaseCurrency
                                break
                            }
    readonly property string currencySettings: switch(role){
                            case "BASE":
                                settings.homeCurrency
                                break
                            case "DESTINATION":
                                settings.alternateCurrency
                                break
                            default:
                                settings.homeCurrency
                                break
                            }
    readonly property int initialIndex: switch(role){
                            case "BASE":
                                0
                                break
                            case "DESTINATION":
                                1
                                break
                            default:
                                0
                                break
                            }
                            
    property string role: "BASE"

    Layout.preferredWidth: 70
    //~ Layout.preferredHeight: 200
    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
    
    //~ visibleItemCount: 3
    model: mainModels.currencyModel2
    currentIndex: -1
    delegate: TumblerDelegate {
        itemText: code
    }
    
    Component.onCompleted:{
        switch(settings.startingCurrencies){
            case 0:
                currentIndex = model.find(restoreValue, "code")
            break
            case 1:
                currentIndex = model.find(currencySettings, "code")
            break
            case 2:
                currentIndex = initialIndex
            break
            default:
                currentIndex = initialIndex
            break
        }
    }
    
    onCurrentIndexChanged: reloadData()
}

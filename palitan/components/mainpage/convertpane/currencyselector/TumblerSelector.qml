import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../../../common"


ColumnLayout{
    id: tumblerSelector
        
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
    
    property alias currentIndex: tumbler.currentIndex
    property alias model: tumbler.model
    
    states: [
        State {
            name: "COMPACT"
            PropertyChanges { target: tumblerSelector; Layout.maximumHeight: 120;}
            PropertyChanges { target: currencyLabel; visible: false;}
            //~ PropertyChanges { target: tumbler; visibleItemCount: 3 }
        },
        State {
            name: "NORMAL"
            PropertyChanges { target: tumblerSelector; Layout.maximumHeight: 192; }
            PropertyChanges { target: currencyLabel; visible: true;}
            //~ PropertyChanges { target: tumbler; visibleItemCount: 5 }
        }
    ]
    
    state: "NORMAL"

    Layout.preferredWidth: 80
    Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
    //~ Layout.maximumHeight: 120
    spacing: 0
    
    function initializeValues(){
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
    
    Label{
        id: currencyLabel
        
        Layout.fillWidth: true
        //~ Layout.preferredWidth: tumblerRow.width
        //~ Layout.maximumWidth: 500
        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
        
        text: tumbler.model.get(tumbler.currentIndex).name
        font.pixelSize: 15
        maximumLineCount: 1
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        color: theme.normal.backgroundText
        elide: Text.ElideRight
    }
    
    RowLayout{
        id: tumblerRow
        
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        
        Loader{
            active: role === "BASE"
            asynchronous: true
            sourceComponent: FindButton{}
            visible: status == Loader.Ready
        }
        
        TumblerMouse {
            id: tumbler
            
            Layout.fillHeight: true
            Layout.preferredWidth: 80
            
            visibleItemCount: 3
            model: mainModels.currencyModel2
            currentIndex: -1
            
            delegate: TumblerDelegate {
                itemText: code
            }
            
            
            Component.onCompleted:{
                initializeValues()
                //~ timer.restart()
            }
            
            //~ //WORKAROUND: CurrentIndex displacement is incorrect when visibleItemCount is set dynamically
            //~ Timer{
                //~ id: timer
                //~ interval: 100
                //~ running: false
                //~ onTriggered:{
                    //~ initializeValues()
                //~ }
            //~ }
            
            onCurrentIndexChanged: reloadData()
        }
        
        Loader{
            active: role === "DESTINATION"
            asynchronous: true
            sourceComponent: FindButton{}
            visible: status == Loader.Ready
        }
    }
}
    

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "currencyselector"

RowLayout{
    id: currencySelector
    
    property alias baseIndex: baseCurrencyTumbler.currentIndex
    property alias destinationIndex: destinationCurrencyTumbler.currentIndex
    property alias model: baseCurrencyTumbler.model
    property bool compact: false
    
    Layout.alignment: Qt.AlignBottom
    Layout.preferredWidth: parent.width
    
    TumblerSelector{
        id: baseCurrencyTumbler
        
        role: "BASE"
        state: compact ? "COMPACT" : "NORMAL"
    }
    
    SwapButton{
        id: swapButton
        
        Layout.preferredWidth: 50
        Layout.preferredHeight: Layout.preferredWidth
        Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
        
        onClicked:{
            swap()
        }
    }
    
    TumblerSelector{
        id: destinationCurrencyTumbler
        
        role: "DESTINATION"
        state: compact ? "COMPACT" : "NORMAL"
    }
    
    FindDialog{
        id: findDialog
        
        onAccepted: {
            setCurrencies(findDialog.code1, findDialog.code2)
        }
        
        
        //~ //WORKAROUND: Delay setting of currencies until the Tumbler settles its size
        //~ Connections {
            //~ id: keyboard
            //~ target: Qt.inputMethod
            
            //~ onVisibleChanged:{
                //~ if(!target.visible && (findDialog.code1 || findDialog.code2))
                    //~ setCurrencies(findDialog.code1, findDialog.code2)
            //~ }
        //~ }
    }
}

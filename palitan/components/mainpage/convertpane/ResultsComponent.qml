import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Components 1.3 as UT
import "resultscomponent"

Item{
    id: results
    
    property alias fromLabel: fromLabel
    property alias resultLabel: resultLabel
    property alias exchangeRatesLabel: exchangeRatesLabel
    
    Layout.fillHeight: true
    Layout.fillWidth: true
    
    function showAnimation(){
        if(opacity === 0)
        showAnimation.restart()
    } 
    
    UT.UbuntuNumberAnimation on opacity{
        id: showAnimation
        
        running: false
        from: 0
        to: 1
        easing: UT.UbuntuAnimation.StandardEasing
        duration: UT.UbuntuAnimation.SlowDuration
    }

    ColumnLayout{
        id: resultsColumn    
        
        spacing: 0
        anchors{
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
            
        }
               
        FromLabel{
            id: fromLabel
        }
        
        ResultLabel{
            id: resultLabel
        }
        
            
        Label{
            id: exchangeRatesLabel
            
            Layout.fillWidth: true
            Layout.preferredHeight: 40
        
            text: "1 " + baseCurrency.code + " = " + baseCurrency.rate(destinationCurrency.code) + " " + destinationCurrency.code
            fontSizeMode: Text.HorizontalFit
            minimumPixelSize: 10
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}

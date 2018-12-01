import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Components 1.3 as UT
import "../mainpage"
import "../mainpage/convertpane"
import "../common"
import "../../library/currencies.js" as Currencies

Pane {
    id: convertPane
    
    property var baseCurrency: Currencies.money(mainModels.currencyModel2.get(currencySelector.baseIndex), baseValue)
    property var destinationCurrency: Currencies.money(mainModels.currencyModel2.get(currencySelector.destinationIndex), destinationValue)
    property string baseValue
    property string destinationValue
    
    signal reloadData
    
    function swap(){
        var a = currencySelector.baseIndex
        var b = currencySelector.destinationIndex
                    
        currencySelector.baseIndex = b
        currencySelector.destinationIndex = a
    }
    
    function setCurrencies(code1, code2){
        currencySelector.baseIndex = baseCurrencyTumbler.model.find(code1, "code")
        currencySelector.destinationIndex = destinationCurrencyTumbler.model.find(code2, "code")
    }
    
    function showResult(){
        resultsColumn.showAnimation()
    }
    
    function hideResult(){
        resultsColumn.opacity = 0
    }
    
    ColumnLayout{
        id: mainColumn
        
        anchors.fill: parent
    
        RowLayout{
            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 10
            
            visible: convertPane.height < 400 ? false : true

            Label{
                id: asOfLabel
                
                property bool isUpdated: new Date() === new Date(settings.ratesAsOfDate)
            
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: (mainColumn.width / 2.1)// - 2.5
                Layout.preferredHeight: font.pixelSize
                text: i18n.tr("Data as of") + ": " + Qt.formatDateTime(settings.ratesAsOfDate, "ddd, MMMM dd, yyyy")
                font.pixelSize: 10
                elide: Text.ElideRight
                color: isUpdated ? theme.normal.backgroundTertiaryText : theme.normal.negative
            }
            Label{
                id: sourceLabel
            
                Layout.alignment: Qt.AlignRight
                //~ Layout.fillWidth: true
                Layout.preferredWidth: (mainColumn.width/ 2.1)// - 2.5
                Layout.preferredHeight: font.pixelSize
                text: i18n.tr("Source") + ": " + "open exchange rates"
                font.pixelSize: 10
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignRight
                color: theme.normal.backgroundTertiaryText
            }
        }
        
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout{
                id: resultsColumn    
                
                //~ Layout.preferredWidth: parent.width
                //~ Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                //~ Layout.fillHeight: true
                //~ anchors.fill: parent
                //~ height: 100
                anchors{
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    
                }
                
                function showAnimation(){
                    if(opacity === 0)
                    showAnimation.restart()
                }        
                
                Label {
                    id: fromLabel
                    
                    visible: convertPane.height < 400 ? false : true
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: 15
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    text: baseCurrency.formattedValue() + " " + baseCurrency.code + " ="
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.HorizontalFit
                    elide: Label.ElideRight             
                    minimumPixelSize: 10
                    font.weight: Font.Medium
                }
                
                Label {
                    id: resultLabel
                    
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: 50
                    Layout.alignment: Qt.AlignHCenter
                    text: baseCurrency.convert(destinationCurrency.code)
                    font.pixelSize: convertPane.height < 400 ? 40 : 50
                    horizontalAlignment: Text.AlignHCenter | Qt.AlignVCenter
                    verticalAlignment: Text.AlignVCenter
                    fontSizeMode: Text.HorizontalFit
                    minimumPixelSize: 20
                    elide: Label.ElideRight
                    color: theme.normal.positive
                    font.weight: Font.Medium
                }
                
                UT.UbuntuNumberAnimation on opacity{
                    id: showAnimation
                    
                    from: 0
                    to: 1
                    easing: UT.UbuntuAnimation.StandardEasing
                    duration: UT.UbuntuAnimation.SlowDuration
                }
                
                Column{
                    Layout.preferredWidth: parent.width
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    spacing: 5
                    
                
                    Label{
                        id: exchangeRatesLabel
                    
                        property real destinationValue
                    
                        text: "1 " + baseCurrency.code + " = " + baseCurrency.rate(destinationCurrency.code) + " " + destinationCurrency.code
                        font.pixelSize: convertPane.height < 400 ? 10 : 15
                        fontSizeMode: Text.HorizontalFit
                        minimumPixelSize: 10
                        height: 15
                        anchors{
                            left: parent.left
                            right: parent.right
                        }
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
        
        CurrencySelector{
            id: currencySelector
        }
    }
}

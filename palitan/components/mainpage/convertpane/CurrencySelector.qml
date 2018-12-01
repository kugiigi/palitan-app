import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "currencyselector"

RowLayout{
	id: currencySelector
	
	property alias baseIndex: baseCurrencyTumbler.currentIndex
	property alias destinationIndex: destinationCurrencyTumbler.currentIndex
	
	Layout.alignment: Qt.AlignBottom
	Layout.preferredWidth: parent.width
	
	TumblerSelector{
		id: baseCurrencyTumbler
		
		role: "BASE"
		onCurrentIndexChanged: console.log(parent.height)
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
	}
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import "../mainpage/fullviewpane"
import "../common"
import "../../library/currencies.js" as Currencies


Pane {
	id: fullViewPane
	
	property bool flippedAll: false
	property string inputTextValue
	
	function showSortDialog(isBottom){
		if(isBottom){
			sortDialog.openBottom()
		}else{
			sortDialog.openNormal()
		}
	}
	
	ListView {
		id: listView
		
		snapMode: ListView.SnapToItem 
		anchors{
			top: parent.top
			left: parent.left
			right: parent.right
			bottom: parent.bottom
			bottomMargin: 10
		}
		spacing: 5
		model: mainModels.sortedCurrencies
		delegate: FullViewDelegate{
			flippedGlobal: flippedAll
			currency1: convertPane.baseCurrency
			currency2: Currencies.money(model, destinationValue)
			baseValue: inputTextValue ? inputTextValue : 0
			destinationValue: inputTextValue ? inputTextValue : 0
		}
	}
	
	SortDialog{
		id: sortDialog
	}
}

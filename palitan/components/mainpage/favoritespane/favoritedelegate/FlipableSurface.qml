import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item{
	id: flipableSurface
	
	property var currency1 
	property var currency2
	
	readonly property real surfaceMargins: 10
	
	anchors.fill: parent
	
	ColumnLayout{
		id: column
		
		anchors{
			fill: parent
			margins: surfaceMargins
		}
		
		width: parent.width
		
		FlipableSurfaceHeader{
			id: header
			
			Layout.alignment: Qt.AlignTop
			Layout.preferredHeight: 40
		}
		
		FlipableSurfaceContent{
			id: content
			
			Layout.alignment: Qt.AlignTop
			Layout.fillHeight: true
		}
		
		Label{
			id: exchangeRatesLabel
		
			text: "1 " + currency1.code + " = " + currency1.rate(currency2.code) + " " + currency2.code
			font.pixelSize: 10
			anchors{
				left: parent.left
				right: parent.right
			}
			horizontalAlignment: Text.AlignRight
		}
	}
}

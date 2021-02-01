import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Column{
	id: flipableSurfaceContent
	

	readonly property bool showCurrencyCode: settings.currencyFormatting !== 1
	
	RowLayout{
		id: fromRow
		
		width: parent.width
		height: 15
		spacing: 2
		
		
		Label{
			id: valueLabel
			
			text: currency1.formattedValue()
			font.pixelSize: 15
			horizontalAlignment: Text.AlignRight
			color: theme.normal.foregroundText
			elide: Label.ElideRight
			fontSizeMode: Text.HorizontalFit
			minimumPixelSize: 10
			Layout.fillWidth: true
            Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
		}
		Label{
			id: codeLabel1
			
			text: showCurrencyCode ? currency1.code + " =" : " ="
			font.pixelSize: 10
			horizontalAlignment: Text.AlignRight
			color: theme.normal.foregroundText
			elide: Label.ElideRight
			width: showCurrencyCode ? 30 : 10
            Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
		}
	}
	
	RowLayout{
		id: resultRow
		
		width: parent.width
		height: 30
		spacing: 2
		
		
		Label {
			id: valueLabel2
			
			text: currency1.convert(currency2.code)
			font.pixelSize: 30
			horizontalAlignment: Text.AlignRight
			color: theme.normal.positive
			elide: Label.ElideRight
			fontSizeMode: Text.HorizontalFit
			minimumPixelSize: 20
			Layout.fillWidth: true
            Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
		}

		Label {
			id: codeLabel2
			
			text: currency2.code
			visible: showCurrencyCode
			font.pixelSize: 15
			horizontalAlignment: Text.AlignRight
			color: theme.normal.positive
			elide: Label.ElideRight
			width: 30
            Layout.alignment: Qt.AlignBaseline | Qt.AlignHCenter
		}
	}
}

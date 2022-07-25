import QtQuick 2.9

Rectangle{
	id: flipableActions
	
	readonly property real buttonsMargin: 10
	
	radius: 10
	
	color: theme.normal.foreground
	width: positiveColumn.width
	
	//This will make the radius shown only on the right side
	Rectangle{color: parent.color; anchors.fill: parent; anchors.rightMargin: parent.radius}
	
	Column{
		id: negativeColumn
		
		anchors{
			top: parent.top
			topMargin: buttonsMargin
			bottom: positiveColumn.top
		}
		
		FlipableActionButton{
			iconName: "non-starred" //"delete"
			onClicked: confirmDelete(index)
		}
	}
	
	Column{
		id: positiveColumn
		
		anchors{
			bottom: parent.bottom
			bottomMargin: buttonsMargin
		}
		
		spacing: 7
		
		FlipableActionButton{
			iconName: "user-switch"
			onClicked: flipable.flipped = !flipable.flipped
		}
		
//~ 		FlipableActionButton{
//~ 			iconName: "next"
//~ 			onClicked: {
//~ 				var code1 = flipable.flipped ? currency2.code : currency1.code
//~ 				var code2 = flipable.flipped ? currency1.code : currency2.code
				
//~ 				setConvertPane(code1, code2)
//~ 			}
//~ 		}
	}
}

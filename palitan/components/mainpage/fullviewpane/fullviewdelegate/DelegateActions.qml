import QtQuick 2.9
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT

Rectangle{
	id: delegateActions
	
	readonly property real buttonsMargin: 10
	
	radius: 10
	
	color: theme.normal.foreground
	width: actionButton.width
	
	//This will make the radius shown only on the right side
	Rectangle{color: parent.color; anchors.fill: parent; anchors.rightMargin: parent.radius}

	ToolButton{
		id: actionButton
		
		flat: true
		//~ height: width
	    focusPolicy: Qt.NoFocus
	    anchors.verticalCenter: parent.verticalCenter
	    onClicked: flipable.flipped = !flipable.flipped
	    
		UT.Icon {
			id: icon
			
			implicitWidth: 20
			implicitHeight: implicitWidth
			anchors.centerIn: parent
			color: theme.normal.foregroundText
			name: "user-switch"
		}
	}
}

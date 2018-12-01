import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT

ToolButton{
	id: flipableActionButton
	
	property alias iconName: icon.name
	
	flat: true
	height: width
    focusPolicy: Qt.NoFocus
    
	UT.Icon {
		id: icon
		
		implicitWidth: 20
		implicitHeight: implicitWidth
		anchors.centerIn: parent
		color: theme.normal.foregroundText
	}
}

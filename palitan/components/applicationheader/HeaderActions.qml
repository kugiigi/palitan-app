import QtQuick 2.9
import QtQuick.Controls 2.2

Row{
	id: headerActions
	
	property alias model: repeater.model
	
	spacing: 5
	
	anchors{
		top: parent.top
		bottom: parent.bottom
	}
	
	Repeater {
		id: repeater
		
		HeaderToolButton{
			iconName: modelData ? modelData.iconName : ""
			onClicked: {
				modelData.trigger(false)
			}
		}
	}
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT

ToolButton {
	id: headerToolButton
	
	property alias iconName: icon.name
	
	anchors.verticalCenter: parent.verticalCenter

	contentItem: UT.Icon {
		id: icon
		
		implicitWidth: 15//25//units.gu(3)
		implicitHeight: implicitWidth
	}
}

import QtQuick 2.9
import Lomiri.Components 1.3 as UT

Column{
	spacing: 10
	
	property alias code1: comboBox1.code
	property alias code2: comboBox2.code
	
	anchors{
		left: parent.left
		right: parent.right
	}
	
	ComboBoxItem{
		id: comboBox1
		
		currentIndex: 0
	}
	
	UT.Icon {
		id: separator
		
		implicitWidth: 20
		implicitHeight: implicitWidth
		anchors.horizontalCenter: parent.horizontalCenter
		color: theme.normal.baseText
		name: "go-last"
		transform: Rotation {
				angle: 90
				origin.x: separator.width / 2
				origin.y: separator.height / 2
			}
	}
	
	ComboBoxItem{
		id: comboBox2
		
		currentIndex: 1
	}
}

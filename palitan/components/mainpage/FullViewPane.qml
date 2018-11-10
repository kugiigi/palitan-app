import QtQuick 2.9
import QtQuick.Controls 2.2
import "../mainpage"
import "../common"


Pane {
	id: convertPane
	
	Column {
        spacing: units.gu(10)
        anchors{
            top: parent.top
            topMargin: units.gu(5)
            left: parent.left
            leftMargin: units.gu(5)
            right: parent.right
            rightMargin: units.gu(5)
        }

        Label{
			text: "This is the Full View page"
		}
    }
}

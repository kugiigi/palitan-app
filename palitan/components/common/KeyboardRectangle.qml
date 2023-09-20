import QtQuick 2.12
import QtQuick.Window 2.2

Item {
	id: keyboardRectangle

	height: keyboard.target.visible ? keyboard.target.keyboardRectangle.height / Screen.devicePixelRatio : 0
	anchors {
		left: parent.left
		right: parent.right
		bottom: parent.bottom
	}
}

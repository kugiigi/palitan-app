import QtQuick 2.9
import QtQuick.Controls 2.2
import "tabfooter"

        
TabBar {
	id: tabBar
	
	visible: !keyboard.target.visible
	currentIndex: 1
	
	//WORKAROUND: For issue when layout is wrong on width change
	onWidthChanged: {
		visible = false
		visible = Qt.binding(function(){return !keyboard.target.visible})
	}
	
	background: Rectangle {
        color: theme.normal.foreground
        anchors{
			fill: parent
			leftMargin: -border.width
			rightMargin: -border.width
			bottomMargin: -border.width
		}
        border{
			width: 1
			color: theme.normal.base
		}
    }

	TabFooterButton {
		id: favoritesButton
		
		text: i18n.tr("Favorites")
		iconName: "starred"
	}
	
	TabFooterButton {
		id: convertButton
		
		text: i18n.tr("Convert")
		iconName: "swap"
	}
	
	TabFooterButton {
		id: fullButton
		
		text: i18n.tr("Full View")
		iconName: "stock_document"
	}
}

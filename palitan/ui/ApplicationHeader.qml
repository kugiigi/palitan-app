import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../components/common"
import "../components/applicationheader"


ToolBar {
	id: applicationHeader
	
	property list<BaseAction> leftActions
	property list<BaseAction> rightActions
	
	//WORKAROUND: Label "HorizontalFit" still uses the height of the unadjusted font size.
	implicitHeight: 50
	
	function triggerRight(fromBottom){
		if(rightActions.length === 1){
			rightActions[0].trigger(fromBottom)
		}else{
			rightMenu.openBottom()
		}
	}
	
	function triggerLeft(fromBottom){
		if(leftActions.length === 1){
			leftActions[0].trigger(fromBottom)
		}
	}
	
	
	RowLayout {
		spacing: 10
		anchors.fill: parent
		
		HeaderActions{
			id: leftHeaderActions
			
			model: leftActions
		}
		
		HeaderTitle{
			id: headerTitle
			
			text: stackView.currentItem ? stackView.currentItem.title : "Palitan"
			Layout.fillWidth: true
		}
		
		HeaderActions{
			id: rightHeaderActions
			
			model: rightActions.length === 1 ? rightActions : 0
			
			HeaderToolButton {
				id: overflowRightButton
				
				visible: rightActions ? rightActions.length > 1 : false
				iconName:  "contextual-menu"
				
				onClicked: {
					rightMenu.openTop()
				}
				
				MenuActions{
					id: rightMenu
					
					transformOrigin: Menu.TopRight
					model: rightActions
				}
			}
		}
	}
	
	Shortcut {
        sequences: ["Esc", "Back"]
		enabled: stackView.depth > 1
        onActivated: {
            triggerLeft(false)
        }
    }

    Shortcut {
        sequence: "Menu"
        onActivated: triggerLeft(false)
    }
}

import QtQuick 2.9
import Ubuntu.Components.Themes.Ambiance 1.3 as Ambiance
import Ubuntu.Components.Themes.SuruDark 1.3 as SuruDark
import QtQuick.Controls 2.2
import "components/listmodels"
import "components/common"
import "ui"

ApplicationWindow {
    id: mainView


    property string displayMode: "Phone" //"Desktop" //"Phone" //"Tablet"
    property QtObject theme: settings.currentTheme === "SuruDark" ? suruDarkTheme : ambianceTheme

    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    title: "Palitan"
    visible: false
    minimumWidth: 300
    
    //~ color: "black"//theme.normal.background
    
    background: Rectangle{color: theme.normal.background}

    width: switch (displayMode) {
           case "Phone":
               units.gu(50)
               break
           case "Tablet":
               units.gu(100)
               break
           case "Desktop":
               units.gu(120)
               break
           default:
               units.gu(120)
               break
           }
    height: switch (displayMode) {
            case "Phone":
                units.gu(89)
                break
            case "Tablet":
                units.gu(56)
                break
            case "Desktop":
                units.gu(68)
                break
            default:
                units.gu(68)
                break
            }

    property string current_version: "0.01"
    
    Ambiance.Palette{id: ambianceTheme}
    SuruDark.Palette{id: suruDarkTheme}
    
    ToolTip {
		id: tooltip
		
		function display(customText, position, customTimeout){
			switch(position){
				case "TOP":
					y = 10;
				break;
				case "BOTTOM":
					y = mainView.height - 150;
				break;
				default:
					y = 10;
				break;
			}
			
			if(customTimeout){
				timeout = customTimeout
			}
			
			text = customText
			
			visible = true
		}
		
		timeout: 3000
    }


	SettingsComponent{
		id: settings
	}

    Connections {
        id: keyboard
        target: Qt.inputMethod
    }
    
    MainModels{
		id: mainModels
	}
	
	SettingsModels{
		id: settingsModels
	}

    header: ApplicationHeader{
		id: applicationHeader
		
		leftActions: BaseAction{
			text: i18n.tr("Menu")
			iconName: stackView.depth > 1 ? "back" : "navigation-menu"
			
			onTrigger:{
				if (stackView.depth > 1) {
                        stackView.pop()
                        drawer.resetListIndex()
                    } else {
						if(isBottom){
							drawer.openBottom()
						}else{
							drawer.openTop()
						}
                    }
				}
			}
			
		rightActions: stackView.currentItem ? stackView.currentItem.headerRightActions : 0
	}
	
	MenuDrawer{
		id: drawer
		 
		 model:  [
			{ title: i18n.tr("Settings"), source: Qt.resolvedUrl("ui/SettingsPage.qml"), iconName: "settings" }
			,{ title: i18n.tr("About"), source: Qt.resolvedUrl("ui/AboutPage.qml"), iconName: "info" }
			,{ title: i18n.tr("Donate"), source: Qt.resolvedUrl("ui/DonatePage.qml"), iconName: "like" }
		]
	}
	
	StackView {
        id: stackView
        
        anchors{
			left: parent.left
			right: parent.right
			top: parent.top
			bottom: keyboardRec.top
		}  
    }
    
    Loader {
		id: mainPageLoader
		active: true
		asynchronous: true
		source: "ui/MainPage.qml"

		visible: status == Loader.Ready

		onLoaded: {
			stackView.push(item)
			mainView.visible = true
		}
	}  
	
	KeyboardRectangle{
		id: keyboardRec
	}
	
	BottomSwipeArea{
		id: rightSwipeArea
		
		//~ width: parent.width / 2
		anchors{
			right: parent.right
			left: parent.horizontalCenter
		}
		onTriggered: applicationHeader.triggerRight(true)
	}
	
	BottomSwipeArea{
		id: leftSwipeArea
		
		width: parent.width / 2
		anchors{
			left: parent.left
			right: parent.horizontalCenter
		}
		onTriggered: applicationHeader.triggerLeft(true)
	}
}

import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Controls.Suru 2.2
import Ubuntu.Components.Themes.Ambiance 1.3 as Ambiance
import Ubuntu.Components.Themes.SuruDark 1.3 as SuruDark
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "components/listmodels"
import "components/common"
import "components/mainpage"
import "ui"

ApplicationWindow {
    id: mainView

    readonly property QtObject drawer: drawerLoader.item
    readonly property string current_version: "1.8"
    readonly property var suruTheme: switch(settings.currentTheme) {
            case "System":
                undefined
                break
            case "Ambiance":
                Suru.Light
                break
            case "SuruDark":
                Suru.Dark
                break
        }
    
    property string displayMode: "Phone" //"Desktop" //"Phone" //"Tablet"
    property QtObject theme: Suru.theme === 1 ? suruDarkTheme : ambianceTheme

    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    title: "Palitan"
    visible: false
    minimumWidth: 300
    
    Suru.theme: suruTheme //Suru.Light //Suru.Dark

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
    
    Ambiance.Palette{id: ambianceTheme}
    SuruDark.Palette{id: suruDarkTheme}
    
    MainView{
        //Only for making translation work
        id: dummyMainView
        applicationName: "palitan.kugiigi"
        visible: false
    }
    
    GlobalTooltip{
        id: tooltip
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

        expandable: mainView.height >= units.gu(60)
        flickable: stackView.currentItem.flickable
        leftActions: BaseAction{
            visible: drawerLoader.visible
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
    
    Loader {
        id: drawerLoader
        
        active: true
        asynchronous: true
        sourceComponent: MenuDrawer{
                id: drawer
                 
                 model:  [
                    { title: i18n.tr("Settings"), source: Qt.resolvedUrl("ui/SettingsPage.qml"), iconName: "settings" }
                    ,{ title: i18n.tr("About"), source: Qt.resolvedUrl("ui/AboutPage.qml"), iconName: "info" }
                    ,{ title: i18n.tr("Help"), source: Qt.resolvedUrl("ui/HelpPage.qml"), iconName: "help" }
                ]
            }

        visible: status == Loader.Ready
    }
    
    StackView {
        id: stackView
        
        function gotToHelp(navigation){
            push(Qt.resolvedUrl("ui/HelpPage.qml"), {initialNavigation: navigation})
        }
        
        initialItem: Rectangle{color: theme.normal.background}
        
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
            mainView.visible = true
            stackView.replace(item)
            item.focusTextField()
        }
    }  
    
    KeyboardRectangle{
        id: keyboardRec
    }
    
    Loader {
        id: rightSwipeAreaLoader
        
        active: true
        asynchronous: true
        visible: status == Loader.Ready
        sourceComponent: BottomSwipeArea{
            onTriggered: applicationHeader.triggerRight(true)
        }
        
        anchors{
            right: parent.right
            left: parent.horizontalCenter
            bottom: parent.bottom
        }
    }  
    
    Loader {
        id: leftSwipeAreaLoader
        
        active: true
        asynchronous: true
        visible: status == Loader.Ready
        sourceComponent: BottomSwipeArea{
            onTriggered: applicationHeader.triggerLeft(true)
        }
        
        anchors{
            left: parent.left
            right: parent.horizontalCenter
            bottom: parent.bottom
        }
    } 
}

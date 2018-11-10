import QtQuick 2.9
import Ubuntu.Components 1.3 as UT
import Ubuntu.Components.Themes.Ambiance 1.3 as Ambiance
import Ubuntu.Components.Themes.SuruDark 1.3 as SuruDark
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import "components/listmodels"
import "components/common"

ApplicationWindow {
    id: mainView


    property string displayMode: "Phone" //"Desktop" //"Phone" //"Tablet"
    //property alias headerTitle: titleLabel.text
    
    property QtObject theme: settings.currentTheme === "SuruDark" ? suruDarkTheme : ambianceTheme

    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    title: "Test"
    visible: false
    
    //~ Material.theme: Material.Dark
    //~ Material.accent: Material.Purple
    
    //~ color: "black"//theme.normal.background

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


    Settings {
        id: settings

		property string style: "Suru"
        property string currentTheme: "Ambiance"
        
        property string homeCurrency: "PHP"
        property string alternateCurrency: "USD"
        
        property int startingCurrencies: 2
        property string previousBaseCurrency: ""
        property string previousDestinationCurrency: ""
        
        property string ratesAsOfDate: ""
        property string ratesCacheJSON: ""
        
        Component.onCompleted:{
			if(ratesAsOfDate === "" || ratesCacheJSON === ""){
				mainModels.ratesDataModel.fetchCacheJSON(
				function(isSuccess, jsonData){
					if(isSuccess){
						ratesAsOfDate = jsonData.parsedData.date
						ratesCacheJSON = jsonData.rawData
					}
				});
			}
		}
    }

    Connections {
        id: keyboard
        target: Qt.inputMethod
    }

    Shortcut {
        sequences: ["Esc", "Back"]
//        enabled: stackView.depth > 1
        onActivated: {
            stackView.pop()
            listView.currentIndex = -1
        }
    }

    Shortcut {
        sequence: "Menu"
        onActivated: optionsMenu.open()
    }

    header: ToolBar {
		//WORKAROUND: Label "HorizontalFit" still uses the height of the unadjusted font size.
        implicitHeight: 50
        
        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
				id: leftButton
				
				anchors.verticalCenter: parent.verticalCenter
				function trigger(verticalLayout){
					if (stackView.depth > 1) {
                        stackView.pop()
                       listView.currentIndex = -1
                    } else {
						//drawer.edge = Qt.LeftEdge
						if(verticalLayout){
							drawer.verticalLayoutDirection = verticalLayout
						}
						
                        drawer.open()
                    }
				}
				
                contentItem: UT.Icon {
                    id: icon
                    
                    implicitWidth: units.gu(3)
                    implicitHeight: implicitWidth
                    name: stackView.depth > 1 ? "back" : "navigation-menu"
                }
                onClicked: {
                   trigger(ListView.TopToBottom)
                }
            }

            Label {
                id: titleLabel
                
                text: stackView.currentItem.title //i18n.tr("Palitan")
                font.pixelSize: units.gu(3)
                elide: Label.ElideRight
                //horizontalAlignment: Qt.AlignHCenter
                //verticalAlignment: Qt.AlignVCenter
                fontSizeMode: Text.HorizontalFit
				minimumPixelSize: 10
                Layout.fillWidth: true
				anchors.verticalCenter: parent.verticalCenter
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				//~ onHeightChanged:{
					//~ console.log(height)
				//~ }
            }
            

            ToolButton {
				anchors.verticalCenter: parent.verticalCenter
				
                contentItem: UT.Icon {
                                 id: iconMenu
                                 
                                 implicitWidth: units.gu(3)
                                 implicitHeight: implicitWidth
                                 name: "contextual-menu"
                             }
                onClicked: {
                    optionsMenu.x = optionsMenu.parent.width - optionsMenu.width
                    optionsMenu.y = 0
                    optionsMenu.open()
                }

                Menu {
                    id: optionsMenu

                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: i18n.tr("Add to favorites")
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem {
                        text: i18n.tr("Swap")
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }
    
    
    UT.SwipeArea{
		z: 1
			direction: UT.SwipeArea.Upwards
			width: parent.width / 2
			height: units.gu(2)
			anchors{
				right: parent.right
				bottom: parent.bottom
			}
			onDraggingChanged: {
				if(dragging){
					optionsMenu.x = optionsMenu.parent.width - optionsMenu.width
					optionsMenu.y = mainView.height - optionsMenu.height
					optionsMenu.open()
				}	
			}
		}
		UT.SwipeArea{
			z: 1
			direction: UT.SwipeArea.Upwards
			width: parent.width / 2
			height: units.gu(2)
			anchors{
				left: parent.left
				bottom: parent.bottom
			}
			onDraggingChanged: {
				if(dragging){
					//drawer.edge = Qt.BottomEdge
					leftButton.trigger(ListView.BottomToTop)
					//leftButton.trigger(ListView.TopToBottom)
					//~ drawer.verticalLayoutDirection = ListView.BottomToTop
					//~ drawer.open()
				}	
			}
		}
    
    MainModels{
		id: mainModels
	}
	
	Drawer {
        id: drawer
        
        property alias verticalLayoutDirection: listView.verticalLayoutDirection
        property alias orientation: listView.orientation
        
        width: Math.min(mainView.width, mainView.height) / 3 * 2
        height: mainView.height
        interactive: stackView.depth === 1
        dragMargin: 0
        //edge: Qt.LeftEdge
        //closePolicy: Popup.CloseOnPressOutside
        

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent
            //rotation: 180//listView.verticalLayoutDirection === ListView.BottomToTop ? 180 : 0

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                //rotation: 180//ListView.verticalLayoutDirection === ListView.BottomToTop ? 180 : 0
                
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "Settings"; source: "ui/SettingsPage.qml" }
                ListElement { title: "About"; source: "ui/AboutPage.qml" }
                ListElement { title: "Donate"; source: "ui/DonatePage.qml"}
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
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
    
    KeyboardRectangle{
		id: keyboardRec
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
    
    
    Dialog {
        id: settingsDialog
        x: Math.round((mainView.width - width) / 2)
        y: Math.round(mainView.height / 6)
        width: Math.round(Math.min(mainView.width, mainView.height) / 3 * 2)
        modal: true
        focus: true
        title: "Settings"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            settings.currentTheme = styleBox.displayText
            settingsDialog.close()

            //~ if (styleBox.currentIndex !== styleBox.styleIndex) {
                //~ Qt.quit();
            //~ }
        }
        onRejected: {
            //~ styleBox.currentIndex = styleBox.styleIndex
            settingsDialog.close()
        }

        contentItem: ColumnLayout {
            id: settingsColumn
            spacing: 20

            RowLayout {
                spacing: 10

                Label {
                    text: i18n.tr("Theme:")
                }

                ComboBox {
                    id: styleBox
                    
                    model: ListModel {
						id: model
						ListElement { text: "Ambiance" }
						ListElement { text: "SuruDark" }
					}
                    Component.onCompleted: {
                        currentIndex = find(settings.currentTheme, Qt.MatchFixedString)
                        //~ console.log(styleIndex + " - " + currentIndex + " - " + settings.currentTheme)
                        //~ if (styleIndex !== -1)
                            //~ currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label {
                text: "Restart required"
                color: theme.normal.backgroundText //"#e41e25"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Dialog {
        id: aboutDialog
        modal: true
        focus: true
        title: "About"
        x: (mainView.width - width) / 2
        y: mainView.height / 6
        width: Math.min(mainView.width, mainView.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            spacing: 20

            Label {
                width: aboutDialog.availableWidth
                text: "Palitan, your best currency exchange rate app!"
                wrapMode: Label.Wrap
                font.pixelSize: units.gu(3)
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                width: aboutDialog.availableWidth
                text: "In comparison to the desktop-oriented Qt Quick Controls 1, Qt Quick Controls 2 "
                    + "are an order of magnitude simpler, lighter and faster, and are primarily targeted "
                    + "towards embedded and mobile platforms."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }    
}

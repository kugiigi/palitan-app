import QtQuick 2.9
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT

Drawer {
    id: menuDrawer
    
    property alias model: listView.model
    
    readonly property real minimumWidth: 250
    readonly property real preferredWidth: mainView.width * 0.25
    
    width: preferredWidth < minimumWidth ? minimumWidth : preferredWidth
    height: mainView.height
    interactive: stackView.depth === 1
    dragMargin: 0
    
    background: Rectangle{color: theme.normal.background}
    
    function openTop(){
        listView.verticalLayoutDirection = ListView.TopToBottom
        open()
    }
    
    function openBottom(){
        listView.verticalLayoutDirection = ListView.BottomToTop
        open()
    }
    
    function resetListIndex(){
        listView.currentIndex = -1
    }

    ListView {
        id: listView

        focus: true
        currentIndex: -1
        anchors.fill: parent
        anchors.topMargin: applicationHeader.expanded ? applicationHeader.height - applicationHeader.defaultHeight : 0

        delegate: ItemDelegate {
            width: parent.width
            text: modelData.title
            highlighted: ListView.isCurrentItem
            
            indicator: UT.Icon {
                 id: iconMenu
                 
                 implicitWidth: 25
                 implicitHeight: implicitWidth
                 anchors.left: parent.left
                 anchors.leftMargin: 10
                 anchors.verticalCenter: parent.verticalCenter
                 name: modelData ? modelData.iconName : ""
                 color: theme.normal.baseText
             }
             leftPadding: iconMenu.implicitWidth + (iconMenu.anchors.leftMargin * 2)
            
            onClicked: {
                listView.currentIndex = index
                stackView.push(modelData.source)
                drawer.close()
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Lomiri.Components 1.3 as UT

Item{
    property bool display: false
    
    parent: ApplicationWindow.overlay
    anchors.fill: parent
    visible: opacity === 0 ? false : true
    opacity: 0
    
    Rectangle{
        z: -1
        color: UT.LomiriColors.inkstone //theme.normal.raisedText
        anchors.fill: parent
        opacity: 0.7
    }
    
    onDisplayChanged: {
        if(display){
            opacity = 1
        }else{
            delayHideTimer.restart()
        }
    }
    
    ColumnLayout{
        z: 1
        anchors.centerIn: parent
        BusyIndicator {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: i18n.tr("Trying to update data") + "..."
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: theme.normal.raisedSecondaryText
            font.weight: Font.Medium
        }
    }
    
    Timer{
        id: delayHideTimer
        
        running: false
        interval: 1000
        onTriggered: hideAnimation.restart()
    }

    UT.LomiriNumberAnimation on opacity{
        id: hideAnimation
        
        running: false
        from: 1
        to: 0
        easing: UT.LomiriAnimation.StandardEasing
        duration: UT.LomiriAnimation.SlowDuration
    }
}

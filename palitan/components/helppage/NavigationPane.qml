import QtQuick 2.9
import QtQuick.Controls 2.2
import Lomiri.Components 1.3 as UT

DetailsPane{
    id: navigationPane
    
    Button{
        id: oneUIButton
        
        text: i18n.tr("Reach Me!")
        visible: currentIndex === 2
        anchors{
            top: parent.top
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        onClicked: tooltip.display(i18n.tr("Cool right?"), "TOP")
    }
    
    Rectangle{
        id: edgeHint
        
        visible: currentIndex === 1
        color: UT.LomiriColors.blue
        height: 10
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        
        PropertyAnimation { 
            id: appearAnimation
            
            running: visible
            target: edgeHint
            alwaysRunToEnd: true
            property: "opacity"
            to: 1
            duration: UT.LomiriAnimation.SlowDuration
            easing: UT.LomiriAnimation.StandardEasing
            onStopped: hideAnimation.start()
        }
        
        PropertyAnimation {
             id: hideAnimation
             
             target: edgeHint
             alwaysRunToEnd: true
             property: "opacity"
             to: 0
             duration: UT.LomiriAnimation.SlowDuration
             easing: UT.LomiriAnimation.StandardEasing
             onStopped: appearAnimation.start()
         }
    }
}

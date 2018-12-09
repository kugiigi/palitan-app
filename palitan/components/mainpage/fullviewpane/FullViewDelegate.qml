import QtQuick 2.9
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3 as UT
import "../fullviewpane/fullviewdelegate"

Rectangle{
    id: fullViewDelegate
    
    property var currency1
    property var currency2
    property real baseValue
    property real destinationValue
    property bool flippedGlobal: false
    
    color: "transparent"
    radius: 5
    height: 50
    anchors{
        left: parent.left
        leftMargin: 10
        right: parent.right
        rightMargin: 10
    }
    border{
        width: 3
        color: theme.normal.foreground
    }
    
    onBaseValueChanged: currency1.value = baseValue
    
    onFlippedGlobalChanged:{
        if(flippedGlobal){
            flipable.flipped = true
        }else{
            flipable.flipped = false
        }
    }
    
    Flipable {
        id: flipable
    
        property bool flipped: false
        
        anchors{
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: flipableActions.left
        }
    
        front: DelegateSurface{
        }
        
        back: DelegateSurface{
        }
        
        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
            angle: 0    // the default angle
        }
    
        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: flipable.flipped
        }
    
        transitions: Transition {
            UT.UbuntuNumberAnimation { target: rotation; property: "angle"; duration: UT.UbuntuAnimation.BriskDuration }
        }
    }   
        
    DelegateActions{
        id: flipableActions
        
        anchors{
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }
}

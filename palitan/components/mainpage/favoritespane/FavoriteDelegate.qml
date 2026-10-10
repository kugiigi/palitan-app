import QtQuick 2.12
import QtQuick.Controls 2.2
import Lomiri.Components 1.3 as UT
import "favoritedelegate"

Rectangle{
    id: favoriteDelegate
    
    property var currency1
    property var currency2
    property real baseValue
    property real destinationValue
    
    color: hoverHandler.hovered || mouseArea.pressed ? theme.normal.foreground : "transparent"
    radius: 10
    height: 150
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

    HoverHandler {
        id: hoverHandler
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
    
        front: FlipableSurface{
            id: frontFlipableSurface
            
            currency1: favoriteDelegate.currency1
            currency2: favoriteDelegate.currency2
        }
        back: FlipableSurface{
            id: backFlipableSurface
            
            currency1: favoriteDelegate.currency2
            currency2: favoriteDelegate.currency1
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
            UT.LomiriNumberAnimation { target: rotation; property: "angle"; duration: UT.LomiriAnimation.BriskDuration }
        }

        MouseArea {
            id: mouseArea

            anchors.fill: parent
            onClicked: {
                var code1 = flipable.flipped ? currency2.code : currency1.code
				var code2 = flipable.flipped ? currency1.code : currency2.code
				
				setConvertPane(code1, code2)
            }
        }
    }   
        
    FlipableActions{
        id: flipableActions
        
        anchors{
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }
}

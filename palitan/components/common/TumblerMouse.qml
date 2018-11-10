import QtQuick 2.9
import QtQuick.Controls 2.2

Tumbler {
    id: tumbler

	focusPolicy: Qt.NoFocus
    //Mouse wheel support
    MouseArea{
        anchors.fill: parent
        propagateComposedEvents: true
        acceptedButtons: Qt.NoButton

        onWheel:   {
            var wheelY = wheel.angleDelta.y
            for(var i = Math.abs(wheelY); i > 0;i-=120){
                if(wheelY > 0){
                    if(tumbler.currentIndex === 0){
                        tumbler.currentIndex = tumbler.count - 1
                    }else{
                        tumbler.currentIndex--
                    }
                }
                if(wheelY < 0){
                    if(tumbler.currentIndex === tumbler.count - 1){
                        tumbler.currentIndex = 0
                    }else{
                        tumbler.currentIndex++
                    }
                }
            }
        }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

RowLayout{
    id: paneFooter
    
    Layout.margins: 10
    
    Button{
        Layout.preferredWidth: 100
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        
        text: i18n.tr("Previous")
        //~ opacity: view.currentIndex > 0 ? 1 : 0
        enabled: view.currentIndex > 0
        onClicked: view.decrementCurrentIndex()
    }
    
    Item{
        Layout.fillWidth: true
        PageIndicator {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            
            count: view.count
            currentIndex: view.currentIndex
            anchors.centerIn: parent
        }
    }
    
    Button{
        Layout.preferredWidth: 100
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        
        text: i18n.tr("Next")
        //~ opacity: view.currentIndex < (view.count - 1) ? 1 : 0
        enabled: view.currentIndex < (view.count - 1)
        onClicked: view.incrementCurrentIndex()
    }
}

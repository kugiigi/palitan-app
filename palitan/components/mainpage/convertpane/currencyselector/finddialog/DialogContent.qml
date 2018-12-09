import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout{
    id: dialogContent
    
    property alias findTextField: findTextField
    property alias listView: listView
    
    anchors.fill: parent
    
    Label{
        id: emptyLabel
        
        Layout.fillHeight: true
        Layout.fillWidth: true
        
        visible: !listView.visible
        text: !delayTimer.running && findTextField.text ? i18n.tr("No results") : i18n.tr("Type in the input box to search")
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        z: 1
    }
    
    ListView {
        id: listView
        
        Layout.fillHeight: true
        Layout.fillWidth: true
        
        verticalLayoutDirection: ListView.BottomToTop
        visible: model.count > 0
        clip: true
        boundsBehavior: Flickable.DragOverBounds
        model: mainModels.filteredCurrencies
        delegate: ItemDelegate{
            text: name
            anchors{
                left: parent.left
                right: parent.right
            }
            onClicked: {
                if(mode === "BASE"){
                    code1 = code
                }else{
                    code2 = code
                }
                accept()
            }
        }
        ScrollIndicator.vertical: ScrollIndicator { }
    }
    
    RowLayout{
        Layout.alignment: Qt.AlignBottom
        
        TextField {
            id: findTextField
            
            Layout.fillWidth: true
            placeholderText: "Find..."
            font.pixelSize: 15
            inputMethodHints: Qt.ImhNoPredictiveText
            
            onTextChanged: {
                delayTimer.restart()
            }
        }
        
        ToolButton{
            text: i18n.tr("Cancel")
            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            focusPolicy: Qt.NoFocus
            onClicked: close()
        }
    }
}

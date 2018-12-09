import QtQuick 2.9
import QtQuick.Controls 2.2
import "../../../common"
import "finddialog"


BaseDialog {
    id: findDialog
    
    readonly property string emptyFilter: "\0"
    
    property string code1
    property string code2
    property string mode: "BASE"

    modal: true
    maximumWidth: 500
    preferredWidth: parent.width
    height: parent.height * 0.8
    y: (parent.height - height) / 2
    standardButtons: Dialog.NoButton
    parent: stackView
    
    function openDialog(role){
        code1 = ""
        code2 = ""
        mode = role
        open()
    }
    
    function setFilterAsEmpty(){
        dialogContent.listView.model.filter.pattern = new RegExp(emptyFilter)
    }
    
    onAboutToShow:{
        //Do not show anything at first
        setFilterAsEmpty()
        dialogContent.findTextField.text = ""
        dialogContent.findTextField.forceActiveFocus()
    }
    
    DialogContent{
        id: dialogContent
    }

    
    
    Timer {
        id: delayTimer
        
        interval: 400
        
        onTriggered: {
            var searchText = dialogContent.findTextField.text
            if(searchText){
                dialogContent.listView.model.filter.pattern = new RegExp(dialogContent.findTextField.text, "i");
            }else{
                setFilterAsEmpty()
            }
        }
    }
}

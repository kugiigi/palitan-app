import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout{
    id: customPrecision
    
    readonly property int defaultPrecision: 2
    
    CheckBoxItem{
        id: customPrecisionCheckBox
        
        text: i18n.tr("Custom max precision")
        
        Component.onCompleted: checked = settings.customPrecision > -1
        
        onCheckedChanged: {
            if(checked){
                settings.customPrecision = spinBox.value
            }else{
                settings.customPrecision = -1
            }
        }
    }
    
    SpinBox {
        id: spinBox
        
        Layout.leftMargin: 35
        
        visible: customPrecisionCheckBox.checked
        Component.onCompleted: {
            value = settings.customPrecision > -1 ? settings.customPrecision : defaultPrecision
        }
        onValueModified: settings.customPrecision = value
        
        
        //TODO: Disabled because of a bug where OSK cannot be dismissed after focus
        //~ editable: true
        //~ focusPolicy: Qt.StrongFocus
        
        //~ Connections {
            //~ id: keyboard
            //~ target: Qt.inputMethod
            
            //~ //WORKAROUND: Unfocus when OSK is dismissed
            //~ onVisibleChanged: {
                //~ console.log("visible: " + visible)
                //~ if(!visible){
                    //~ console.log("unfocus!")
                    //~ spinBox.focus = false
                //~ }
            //~ }
        //~ }
        
        //Unfocus when hidden
        //~ onVisibleChanged: {
            //~ if(!visible)
                //~ focus = false
        //~ }
        
        //~ onActiveFocusChanged:{
            //~ if(activeFocus){
                //~ settingsFlickable.moveScroll(y + height + 20) 
            //~ }
        //~ }
    }
    
    Label{
        
        visible: spinBox.visible
        readonly property real sampleValue: 9.1234567890123456789012345678901234567891234567890
        
        Layout.fillWidth: true
        Layout.leftMargin: 35
        
        text: i18n.tr("i.e.") + " " + sampleValue.toFixed(spinBox.value)
    }
}

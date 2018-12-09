import QtQuick.Controls 2.2

ToolTip {
    id: tooltip
    
    function display(customText, position, customTimeout){
        switch(position){
            case "TOP":
                y = 10;
            break;
            case "BOTTOM":
                y = mainView.height - 150;
            break;
            default:
                y = 10;
            break;
        }
        
        if(customTimeout){
            timeout = customTimeout
        }
        
        text = customText
        
        visible = true
    }
    
    timeout: 3000
}

import QtQuick.Controls 2.2
import "adddialog"
import "../../common"

BaseDialog {
	id: addDialog
	
	title: i18n.tr("Add new favorite")
	height: 250
	
	onAccepted: {
		var success = addFavorite(dialogContent.code1, dialogContent.code2)
		var tooltipText
			
		if(success){
			tooltipText = i18n.tr("Added to your favorites")
		}else{
			tooltipText = i18n.tr("Already in your favorites")
		}

		tooltip.display(tooltipText, "BOTTOM")
	}
	
	DialogContent{
		id: dialogContent
	}
}

import QtQuick.Controls 2.2
import "sortdialog"
import "../../common"

BaseDialog {
    id: addDialog
    
    title: i18n.tr("Sort")
    height: 270
    
    onAboutToShow:{
        // Reset comboboxes to current sort settings
        dialogContent.sortByComboBox.currentIndex = settingsModels.sortByModel.find(settings.fullViewSortBy, "id")
        dialogContent.sortOrderComboBox.currentIndex = settings.fullViewSortOrder
    }
    
    onAccepted: {
        settings.fullViewSortBy = dialogContent.sortByComboBox.model.getValue(dialogContent.sortByComboBox.currentIndex, "id")
        settings.fullViewSortOrder = dialogContent.sortOrderComboBox.currentIndex
    }
    
    DialogContent{
        id: dialogContent
    }
}

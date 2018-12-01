import QtQuick.Controls 2.2

Dialog {
	id: deleteDialog

	modal: true
	
	standardButtons: Dialog.Yes | Dialog.Cancel
	
	function openDialog(){
		var mapped = listView.currentItem.mapToItem(favoritespPane, -15,-15)
		
		x = mapped.x
		y = mapped.y
		width = listView.currentItem.width
		height = listView.currentItem.height
		open()
	}
	
	onAboutToShow:{
		var base = listView.currentItem.currency1.code
		var destination = listView.currentItem.currency2.code
		
		title = i18n.tr("Unfavorite") + ' "' + base + " - " + destination + '"'
	}
	
	onAccepted: {
		removeFavorites(listView.currentIndex)
		tooltip.display(i18n.tr("Deleted"), "BOTTOM")
	}

	Label {
		text: i18n.tr("Are you sure you want to remove this from your favorites?")
		anchors{
			left: parent.left
			right: parent.right
		}
	}
}

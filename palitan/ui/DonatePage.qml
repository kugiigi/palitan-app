import QtQuick 2.9
import QtQuick.Controls 2.2

BasePage {
    id: donatePage
    
    title: i18n.tr("Donate")
    
    Label{
		text: "This is the Donate page"
		anchors.centerIn: parent
		horizontalAlignment: Text.AlignHCenter
	}
}

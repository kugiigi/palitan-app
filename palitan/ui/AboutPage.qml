import QtQuick 2.9
import QtQuick.Controls 2.2

BasePage {
    id: aboutPage
    
    title: i18n.tr("About")
    
    Label{
		text: "This is the About page"
		anchors.centerIn: parent
		horizontalAlignment: Text.AlignHCenter
	}
}

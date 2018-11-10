import QtQuick 2.9
import QtQuick.Controls 2.2
import "../components/mainpage"

Page {
    id: mainPage
    
    title: switch(currentIndex){
				case 0:
					i18n.tr("Favorites")
				break;
				case 1:
                	convertPane.baseCurrency.name + " to " + convertPane.destinationCurrency.name
				break;
				case 2:
					convertPane.baseCurrency.name
				break;
			}
    property alias currentIndex: swipeView.currentIndex

    SwipeView {
        id: swipeView
        
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        
        onCurrentIndexChanged:{
			tabBar.currentIndex = currentIndex
			
				
		}

		FavoritesPane{
			id: favoritesPane
		}
        ConvertPane{
			id: convertPane
		}
		FullViewPane{
			id: fullViewPane
		}
    }
    
    footer: TabBar {
        id: tabBar
        
        visible: !keyboard.target.visible
        currentIndex: 1

        TabButton {
            text: i18n.tr("Favorites")
        }
        TabButton {
            text: i18n.tr("Convert")
        }
        TabButton {
            text: i18n.tr("Full View")
        }
    }
}

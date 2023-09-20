import QtQuick 2.9
import Qt.labs.settings 1.0
import "../library/currencies.js" as Currencies


Item{
    id: settingsComponent
    
    //Settings page
    property alias style: settings.style
    property alias currentTheme: settings.currentTheme
    property alias homeCurrency: settings.homeCurrency
    property alias alternateCurrency: settings.alternateCurrency
    property alias startingCurrencies: settings.startingCurrencies
    property alias currencyFormatting: settings.currencyFormatting
    property alias customPrecision: settings.customPrecision
    property alias enableHeaderExpand: settings.enableHeaderExpand

    //Saved data
    property alias previousBaseCurrency: settings.previousBaseCurrency
    property alias previousDestinationCurrency: settings.previousDestinationCurrency
    property alias favorites: settings.favorites
    property alias favoritesSorting: settings.favoritesSorting
    property alias fullViewSortBy: settings.fullViewSortBy
    property alias fullViewSortOrder: settings.fullViewSortOrder
    
    property alias ratesAsOfDate: settings.ratesAsOfDate
    property alias ratesCacheJSON: settings.ratesCacheJSON
    
    //Session data (not saved)
    property var homeCurrencyData: Currencies.money(mainModels.currencyModel2.getItem(homeCurrency,"code"))
    property var alternateCurrencyData: Currencies.money(mainModels.currencyModel2.getItem(alternateCurrency,"code"))
    
    Settings {
        id: settings
    
        //Settings page
        property string style: "Suru"
        property string currentTheme: "System"
        property string homeCurrency: "PHP"
        property string alternateCurrency: "USD"
        property int startingCurrencies: 2
        property int currencyFormatting: 0
        property int customPrecision: -1
        
        //Saved data
        property string previousBaseCurrency: ""
        property string previousDestinationCurrency: ""
        property var favorites: [{"base":"PHP" , "destination": "USD", "sequence": 0},{"base": "PHP", "destination": "EUR", "sequence": 1}]
        property int favoritesSorting: 0
        property string fullViewSortBy: "code"
        property int fullViewSortOrder: 0
        
        property string ratesAsOfDate: ""
        property string ratesCacheJSON: ""

        property bool enableHeaderExpand: true
    }
}

import QtQuick 2.9
import Ubuntu.Components 1.3 as UT

Item{
    id: mainModels
    
    property alias currencyModel2: currencyModel2
    property alias sortedCurrencies: sortedCurrencies
    property alias filteredCurrencies: filteredCurrencies
    property alias ratesDataModel: ratesDataModel
    
    UT.SortFilterModel {
        id: sortedCurrencies
        
        model: currencyModel2
        sort.property: settings.fullViewSortBy
        sort.order: switch(settings.fullViewSortOrder){
                    case 0:
                        Qt.AscendingOrder
                        break
                    case 1: 
                        Qt.DescendingOrder
                        break
                    default:
                        Qt.AscendingOrder
                        break
                }
                
        sortCaseSensitivity: Qt.CaseInsensitive
    }
    
    UT.SortFilterModel {
        id: filteredCurrencies
        
        model: currencyModel2
        filter.property: "name"
    }
    
    BaseListModel {
        id: currencyModel2
        
        property bool ready: false
        
        Component.onCompleted: fillData()

        function fillData(){
            append({"code": "AED", "name": i18n.tr("Emirati Dirham"), "symbol": String.fromCharCode(1583, 46, 1573), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "AFN", "name": i18n.tr("Afghanistan Afghani"), "symbol": String.fromCharCode(1547), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
            append({"code": "ALL", "name": i18n.tr("Albania Lek"), "symbol": String.fromCharCode(76, 101, 107), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "AMD", "name": i18n.tr("Armenian Dram"), "symbol": String.fromCharCode(1423), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "ANG", "name": i18n.tr("Netherlands Antilles Guilder"), "symbol": String.fromCharCode(402), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "AOA", "name": i18n.tr("Angolan Kwanza"), "symbol": String.fromCharCode(75, 122), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "ARS", "name": i18n.tr("Argentina Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "AUD", "name": i18n.tr("Australia Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "AWG", "name": i18n.tr("Aruba Guilder"), "symbol": String.fromCharCode(402), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "AZN", "name": i18n.tr("Azerbaijan Manat"), "symbol": String.fromCharCode(8380), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "BAM", "name": i18n.tr("Bosnia and Herzegovina Convertible Marka"), "symbol": String.fromCharCode(75, 77), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "BBD", "name": i18n.tr("Barbados Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "BDT", "name": i18n.tr("Bangladeshi Taka"), "symbol": String.fromCharCode(84 ,107), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "BGN", "name": i18n.tr("Bulgaria Lev"), "symbol": String.fromCharCode(1083, 1074), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "BHD", "name": i18n.tr("Bahraini Dinar"), "symbol": String.fromCharCode(1583, 46, 1576), "decimal": ".", "thousand": " ", "precision": "3", "format": "%s%v"})
            append({"code": "BIF", "name": i18n.tr("Burundian Franc"), "symbol": String.fromCharCode(70, 66, 117), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "BMD", "name": i18n.tr("Bermuda Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "BND", "name": i18n.tr("Brunei Darussalam Dollar"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "BOB", "name": i18n.tr("Bolivia Bolíviano"), "symbol": String.fromCharCode(36, 98), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "BRL", "name": i18n.tr("Brazil Real"), "symbol": String.fromCharCode(82, 36), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "BSD", "name": i18n.tr("Bahamas Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "BTC", "name": i18n.tr("Bitcoin"), "symbol": String.fromCharCode(579), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "BTN", "name": i18n.tr("Bhutanese Ngultrum"), "symbol": String.fromCharCode(78 ,117 ,46), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "BWP", "name": i18n.tr("Botswana Pula"), "symbol": String.fromCharCode(80), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "BYN", "name": i18n.tr("Belarus Ruble"), "symbol": String.fromCharCode(66, 114), "decimal": ".", "thousand": " ", "precision": "2", "format": "%v %s"})
            append({"code": "BZD", "name": i18n.tr("Belize Dollar"), "symbol": String.fromCharCode(66, 90, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "CAD", "name": i18n.tr("Canada Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "CDF", "name": i18n.tr("Congolese Franc"), "symbol": String.fromCharCode(70 ,67), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "CHF", "name": i18n.tr("Switzerland Franc"), "symbol": String.fromCharCode(67, 72, 70), "decimal": ".", "thousand": "'", "precision": "2", "format": "%s%v"})
            append({"code": "CLF", "name": i18n.tr("Chilean Unidad de Fomento"), "symbol": String.fromCharCode(85 ,70), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "CLP", "name": i18n.tr("Chile Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "0", "format": "%s%v"})
            append({"code": "CNH", "name": i18n.tr("China Yuan Renminbi (Offshore)"), "symbol": String.fromCharCode(165), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "CNY", "name": i18n.tr("China Yuan Renminbi (Onshore)"), "symbol": String.fromCharCode(165), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
            append({"code": "COP", "name": i18n.tr("Colombia Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "0", "format": "%s%v"})
            append({"code": "CRC", "name": i18n.tr("Costa Rica Colon"), "symbol": String.fromCharCode(8353), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "CUC", "name": i18n.tr("Cuban Convertible Peso"), "symbol": String.fromCharCode(67 ,85 ,67 ,36), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "CUP", "name": i18n.tr("Cuba Peso"), "symbol": String.fromCharCode(8369), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "CVE", "name": i18n.tr("Cape Verdean Escudo"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "CZK", "name": i18n.tr("Czech Republic Koruna"), "symbol": String.fromCharCode(75, 269), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
            append({"code": "DJF", "name": i18n.tr("Djiboutian Franc"), "symbol": String.fromCharCode(70 ,100 ,106), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "DKK", "name": i18n.tr("Denmark Krone"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
            append({"code": "DOP", "name": i18n.tr("Dominican Republic Peso"), "symbol": String.fromCharCode(82, 68, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "DZD", "name": i18n.tr("Algerian Dinar"), "symbol": String.fromCharCode(68 ,65), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "EGP", "name": i18n.tr("Egypt Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "ERN", "name": i18n.tr("Eritrean Nakfa"), "symbol": String.fromCharCode(78 ,107 ,102), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "ETB", "name": i18n.tr("Ethiopian Birr"), "symbol": String.fromCharCode(66 ,114), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "EUR", "name": i18n.tr("Euro Member Countries"), "symbol": String.fromCharCode(8364), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "FJD", "name": i18n.tr("Fiji Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "FKP", "name": i18n.tr("Falkland Islands (Malvinas) Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "GBP", "name": i18n.tr("United Kingdom Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "GEL", "name": i18n.tr("Georgian Lari"), "symbol": String.fromCharCode(4314), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "GGP", "name": i18n.tr("Guernsey Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "GHS", "name": i18n.tr("Ghana Cedi"), "symbol": String.fromCharCode(162), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "GIP", "name": i18n.tr("Gibraltar Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "GMD", "name": i18n.tr("Gambian Dalasi"), "symbol": String.fromCharCode(68), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "GNF", "name": i18n.tr("Guinean Franc"), "symbol": String.fromCharCode(70 ,71), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "GTQ", "name": i18n.tr("Guatemala Quetzal"), "symbol": String.fromCharCode(81), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "GYD", "name": i18n.tr("Guyana Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "HKD", "name": i18n.tr("Hong Kong Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "HNL", "name": i18n.tr("Honduras Lempira"), "symbol": String.fromCharCode(76), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "HRK", "name": i18n.tr("Croatia Kuna"), "symbol": String.fromCharCode(107, 110), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "HTG", "name": i18n.tr("Haitian Gourde"), "symbol": String.fromCharCode(71), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "HUF", "name": i18n.tr("Hungary Forint"), "symbol": String.fromCharCode(70, 116), "decimal": ",", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "IDR", "name": i18n.tr("Indonesia Rupiah"), "symbol": String.fromCharCode(82, 112), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "ILS", "name": i18n.tr("Israel Shekel"), "symbol": String.fromCharCode(8362), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "IMP", "name": i18n.tr("Isle of Man Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "INR", "name": i18n.tr("India Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "IQD", "name": i18n.tr("Iraqi Dinar"), "symbol": String.fromCharCode(1583 ,46 ,1593), "decimal": ".", "thousand": " ", "precision": "3", "format": "%s%v"})
            append({"code": "IRR", "name": i18n.tr("Iran Rial"), "symbol": String.fromCharCode(65020), "decimal": "/", "thousand": ",", "precision": "2", "format": "%v %s"})
            append({"code": "ISK", "name": i18n.tr("Iceland Krona"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "JEP", "name": i18n.tr("Jersey Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "JMD", "name": i18n.tr("Jamaica Dollar"), "symbol": String.fromCharCode(74, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "JOD", "name": i18n.tr("Jordanian Dinar"), "symbol": String.fromCharCode(74 ,79 ,68), "decimal": ".", "thousand": " ", "precision": "3", "format": "%s%v"})
            append({"code": "JPY", "name": i18n.tr("Japan Yen"), "symbol": String.fromCharCode(165), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
            append({"code": "KES", "name": i18n.tr("Kenyan Shilling"), "symbol": String.fromCharCode(75 ,83 ,104), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "KGS", "name": i18n.tr("Kyrgyzstan Som"), "symbol": String.fromCharCode(1083, 1074), "decimal": "-", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "KHR", "name": i18n.tr("Cambodia Riel"), "symbol": String.fromCharCode(67 ,82), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "KMF", "name": i18n.tr("Comorian Franc"), "symbol": String.fromCharCode(67 ,70), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "KPW", "name": i18n.tr("Korea (North) Won"), "symbol": String.fromCharCode(8361), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
            append({"code": "KRW", "name": i18n.tr("Korea (South) Won"), "symbol": String.fromCharCode(8361), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
            append({"code": "KWD", "name": i18n.tr("Kuwaiti Dinar"), "symbol": String.fromCharCode(1583 ,46 ,1603), "decimal": ".", "thousand": " ", "precision": "3", "format": "%s%v"})
            append({"code": "KYD", "name": i18n.tr("Cayman Islands Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "KZT", "name": i18n.tr("Kazakhstan Tenge"), "symbol": String.fromCharCode(1083, 1074), "decimal": "-", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "LAK", "name": i18n.tr("Laos Kip"), "symbol": String.fromCharCode(8365), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "LBP", "name": i18n.tr("Lebanon Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "LKR", "name": i18n.tr("Sri Lanka Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "LRD", "name": i18n.tr("Liberia Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "LSL", "name": i18n.tr("Basotho Loti"), "symbol": String.fromCharCode(76), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "LYD", "name": i18n.tr("Libyan Dinar"), "symbol": String.fromCharCode(1604 ,46 ,1583), "decimal": ".", "thousand": " ", "precision": "3", "format": "%s%v"})
            append({"code": "MAD", "name": i18n.tr("Moroccan Dirham"), "symbol": String.fromCharCode(68 ,72), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MDL", "name": i18n.tr("Moldovan Leu"), "symbol": String.fromCharCode(108 ,101 ,105), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MGA", "name": i18n.tr("Malagasy Ariary"), "symbol": String.fromCharCode(65 ,114), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "MKD", "name": i18n.tr("Macedonia Denar"), "symbol": String.fromCharCode(1076, 1077, 1085), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "MMK", "name": i18n.tr("Burmese Kyat"), "symbol": String.fromCharCode(75), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MNT", "name": i18n.tr("Mongolia Tughrik"), "symbol": String.fromCharCode(8366), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MOP", "name": i18n.tr("Macau Pataca"), "symbol": String.fromCharCode(77 ,79 ,80 ,36), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MRO", "name": i18n.tr("Mauritanian Ouguiya"), "symbol": String.fromCharCode(85 ,77), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MRU", "name": i18n.tr("Mauritanian Ouguiya"), "symbol": String.fromCharCode(85 ,77), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MUR", "name": i18n.tr("Mauritius Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "MVR", "name": i18n.tr("Maldivian Rufiyaa"), "symbol": String.fromCharCode(82 ,102), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MWK", "name": i18n.tr("Malawian Kwacha"), "symbol": String.fromCharCode(77 ,75), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "MXN", "name": i18n.tr("Mexico Peso"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "MYR", "name": i18n.tr("Malaysia Ringgit"), "symbol": String.fromCharCode(82, 77), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "MZN", "name": i18n.tr("Mozambique Metical"), "symbol": String.fromCharCode(77, 84), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "NAD", "name": i18n.tr("Namibia Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "NGN", "name": i18n.tr("Nigeria Naira"), "symbol": String.fromCharCode(8358), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "NIO", "name": i18n.tr("Nicaragua Cordoba"), "symbol": String.fromCharCode(67, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "NOK", "name": i18n.tr("Norway Krone"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
            append({"code": "NPR", "name": i18n.tr("Nepal Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "NZD", "name": i18n.tr("New Zealand Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "OMR", "name": i18n.tr("Oman Rial"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "3", "format": "%v %s"})
            append({"code": "PAB", "name": i18n.tr("Panama Balboa"), "symbol": String.fromCharCode(66, 47, 46), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "PEN", "name": i18n.tr("Peru Sol"), "symbol": String.fromCharCode(83, 47, 46), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "PGK", "name": i18n.tr("Papua New Guinean Kina"), "symbol": String.fromCharCode(75), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "PHP", "name": i18n.tr("Philippines Peso"), "symbol": String.fromCharCode(8369), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "PKR", "name": i18n.tr("Pakistan Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "PLN", "name": i18n.tr("Poland Zloty"), "symbol": String.fromCharCode(122, 322), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
            append({"code": "PYG", "name": i18n.tr("Paraguay Guarani"), "symbol": String.fromCharCode(71, 115), "decimal": ",", "thousand": ".", "precision": "0", "format": "%v%s"})
            append({"code": "QAR", "name": i18n.tr("Qatar Riyal"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
            append({"code": "RON", "name": i18n.tr("Romania Leu"), "symbol": String.fromCharCode(108, 101, 105), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "RSD", "name": i18n.tr("Serbia Dinar"), "symbol": String.fromCharCode(1044, 1080, 1085, 46), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "RUB", "name": i18n.tr("Russia Ruble"), "symbol": String.fromCharCode(8381), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
            append({"code": "RWF", "name": i18n.tr("Rwandan Franc"), "symbol": String.fromCharCode(82 ,8355), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "SAR", "name": i18n.tr("Saudi Arabia Riyal"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
            append({"code": "SBD", "name": i18n.tr("Solomon Islands Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SCR", "name": i18n.tr("Seychelles Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SDG", "name": i18n.tr("Sudanese Pound"), "symbol": String.fromCharCode(1580 ,46 ,1587), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "SEK", "name": i18n.tr("Sweden Krona"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": ".", "precision": "2", "format": "%v %s"})
            append({"code": "SGD", "name": i18n.tr("Singapore Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SHP", "name": i18n.tr("Saint Helena Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SLL", "name": i18n.tr("Sierra Leonean Leone"), "symbol": String.fromCharCode(76 ,101), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "SOS", "name": i18n.tr("Somalia Shilling"), "symbol": String.fromCharCode(83), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SRD", "name": i18n.tr("Suriname Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SSP", "name": i18n.tr("South Sudanese Pound"), "symbol": String.fromCharCode(1580 ,46 ,1587), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "STD", "name": i18n.tr("Sao Tomean Dobra"), "symbol": String.fromCharCode(68 ,98), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "STN", "name": i18n.tr("Sao Tomean Dobra"), "symbol": String.fromCharCode(68 ,98), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "SVC", "name": i18n.tr("El Salvador Colon"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SYP", "name": i18n.tr("Syria Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "SZL", "name": i18n.tr("Swazi Lilangeni"), "symbol": String.fromCharCode(76), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "THB", "name": i18n.tr("Thailand Baht"), "symbol": String.fromCharCode(3647), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "TJS", "name": i18n.tr("Tajikistani Somoni"), "symbol": String.fromCharCode(84 ,74 ,83), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "TMT", "name": i18n.tr("Turkmenistani Manat"), "symbol": String.fromCharCode(109), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "TND", "name": i18n.tr("Tunisian Dinar"), "symbol": String.fromCharCode(68 ,84), "decimal": ".", "thousand": " ", "precision": "3", "format": "%s%v"})
            append({"code": "TOP", "name": i18n.tr("Tongan Pa'anga"), "symbol": String.fromCharCode(84 ,36), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "TRY", "name": i18n.tr("Turkey Lira"), "symbol": String.fromCharCode(8378), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "TTD", "name": i18n.tr("Trinidad and Tobago Dollar"), "symbol": String.fromCharCode(84, 84, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "TWD", "name": i18n.tr("Taiwan New Dollar"), "symbol": String.fromCharCode(78, 84, 36), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
            append({"code": "TZS", "name": i18n.tr("Tanzanian Shilling"), "symbol": String.fromCharCode(84 ,83 ,104), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "UAH", "name": i18n.tr("Ukraine Hryvnia"), "symbol": String.fromCharCode(8372), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "UGX", "name": i18n.tr("Ugandan Shilling"), "symbol": String.fromCharCode(85 ,83 ,104), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "USD", "name": i18n.tr("United States Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "UYU", "name": i18n.tr("Uruguay Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "0", "format": "%s%v"})
            append({"code": "UZS", "name": i18n.tr("Uzbekistan Som"), "symbol": String.fromCharCode(1083, 1074), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "VEF", "name": i18n.tr("Venezuela Bolívar"), "symbol": String.fromCharCode(66, 115), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
            append({"code": "VES", "name": i18n.tr("Venezuelan Bolívar"), "symbol": String.fromCharCode(66 ,115), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "VND", "name": i18n.tr("Viet Nam Dong"), "symbol": String.fromCharCode(8363), "decimal": ",", "thousand": ".", "precision": "0", "format": "%v %s"})
            append({"code": "VUV", "name": i18n.tr("Ni-Vanuatu Vatu"), "symbol": String.fromCharCode(86 ,84), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "WST", "name": i18n.tr("Samoan Tala"), "symbol": String.fromCharCode(87 ,83 ,36), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XAF", "name": i18n.tr("Central African CFA Franc BEAC"), "symbol": String.fromCharCode(67 ,70 ,65 ,70), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XAG", "name": i18n.tr("Silver Ounce"), "symbol": String.fromCharCode(65 ,103), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XAU", "name": i18n.tr("Gold Ounce"), "symbol": String.fromCharCode(65 ,117), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XCD", "name": i18n.tr("East Caribbean Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
            append({"code": "XDR", "name": i18n.tr("IMF Special Drawing Rights"), "symbol": String.fromCharCode(83 ,68 ,82), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XOF", "name": i18n.tr("CFA Franc"), "symbol": String.fromCharCode(67 ,70 ,65 ,70), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XPD", "name": i18n.tr("Palladium Ounce"), "symbol": String.fromCharCode(80 ,100), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "XPF", "name": i18n.tr("CFP Franc"), "symbol": String.fromCharCode(67 ,70 ,80 ,70), "decimal": ".", "thousand": " ", "precision": "0", "format": "%s%v"})
            append({"code": "XPT", "name": i18n.tr("Platinum Ounce"), "symbol": String.fromCharCode(80 ,116), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "YER", "name": i18n.tr("Yemen Rial"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
            append({"code": "ZAR", "name": i18n.tr("South Africa Rand"), "symbol": String.fromCharCode(82), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "ZMW", "name": i18n.tr("Zambian Kwacha"), "symbol": String.fromCharCode(90 ,75), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            append({"code": "ZWL", "name": i18n.tr("Zimbabwe Dollar"), "symbol": String.fromCharCode(90, 36), "decimal": ".", "thousand": " ", "precision": "2", "format": "%s%v"})
            

            ready = true
        }
    }
    
    UT.LiveTimer {
        frequency: UT.LiveTimer.Hour
        onTrigger: ratesDataModel.latest = Qt.binding(function(){return Qt.formatDateTime(new Date, "ddd, MMMM dd, yyyy") === Qt.formatDateTime(settings.ratesAsOfDate, "ddd, MMMM dd, yyyy")})
    }
    
    QtObject{
        id: ratesDataModel

        readonly property string appID: "624288a2010b46efa678686799b33599" //openexchangerates app ID
        readonly property string requestURL: encodeURI("https://openexchangerates.org/api/latest.json?app_id=" + appID)
        
        property var data: settings.ratesCacheJSON ? JSON.parse(settings.ratesCacheJSON) : ""
        property bool latest: Qt.formatDateTime(new Date, "ddd, MMMM dd, yyyy") === Qt.formatDateTime(settings.ratesAsOfDate, "ddd, MMMM dd, yyyy")
        property bool loading: false
        
        function fetchCacheJSON(callback){
            var xhr = new XMLHttpRequest();
            var resultData

            loading = true
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        console.log("JSON for cache fetch success")
                        resultData = {"parsedData": JSON.parse(xhr.responseText), "rawData": xhr.responseText}
                        callback(true, resultData)
                    }
                    else {
                        console.log('Failed to fetch JSON for cache');
                        callback(false)
                    }
                }
                loading = false
            };

            xhr.open('GET', Qt.resolvedUrl("../../data/rates.json"), true);
            xhr.send();

        }


        function fetchLatestJSON(callback){
            var xhr = new XMLHttpRequest();

            loading = true
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var error = JSON.parse(xhr.responseText).error
                        if(!error){
                            console.log("exchange rate fetch success")
                            settings.ratesCacheJSON = xhr.responseText
                            settings.ratesAsOfDate = Qt.formatDateTime(new Date(), "yyyy-MM-dd HH:mm:ss")
                            callback(true)
                        }else{
                            callback(false)
                        }
                    }
                    else {
                        console.log('Failed to fetch exchange rate list');
                        callback(false)
                    }
                }
                loading = false
            };

            xhr.open('GET', requestURL, true);
            xhr.send();

        }
        
        Component.onCompleted: {
            if(!latest){
                fetchLatestJSON(function(success){
                        if(!success){
                            if(settings.ratesAsOfDate === "" || settings.ratesCacheJSON === ""){
                                mainModels.ratesDataModel.fetchCacheJSON(
                                function(isSuccess, jsonData){
                                    if(isSuccess){
                                        settings.ratesAsOfDate = jsonData.parsedData.date
                                        settings.ratesCacheJSON = jsonData.rawData
                                    }
                                });
                            }
                        }
                    })
            }
        }
    }
}

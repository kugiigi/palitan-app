import QtQuick 2.9


Item{
	id: mainModels
	
	property alias currencyModel2: currencyModel2
	property alias ratesDataModel: ratesDataModel
	
	
    BaseListModel {
        id: currencyModel2
        
        Component.onCompleted: fillData()

        function fillData(){
			append({"code": "ALL", "name": i18n.tr("Albania Lek"), "symbol": String.fromCharCode(76, 101, 107), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "AFN", "name": i18n.tr("Afghanistan Afghani"), "symbol": String.fromCharCode(1547), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
			append({"code": "ARS", "name": i18n.tr("Argentina Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "AWG", "name": i18n.tr("Aruba Guilder"), "symbol": String.fromCharCode(402), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "AUD", "name": i18n.tr("Australia Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "AZN", "name": i18n.tr("Azerbaijan Manat"), "symbol": String.fromCharCode(8380), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "BSD", "name": i18n.tr("Bahamas Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "BBD", "name": i18n.tr("Barbados Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "BYN", "name": i18n.tr("Belarus Ruble"), "symbol": String.fromCharCode(66, 114), "decimal": "", "thousand": "", "precision": "2", "format": "%v %s"})
			append({"code": "BZD", "name": i18n.tr("Belize Dollar"), "symbol": String.fromCharCode(66, 90, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "BMD", "name": i18n.tr("Bermuda Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "BOB", "name": i18n.tr("Bolivia Bolíviano"), "symbol": String.fromCharCode(36, 98), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "BAM", "name": i18n.tr("Bosnia and Herzegovina Convertible Marka"), "symbol": String.fromCharCode(75, 77), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "BWP", "name": i18n.tr("Botswana Pula"), "symbol": String.fromCharCode(80), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "BGN", "name": i18n.tr("Bulgaria Lev"), "symbol": String.fromCharCode(1083, 1074), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "BRL", "name": i18n.tr("Brazil Real"), "symbol": String.fromCharCode(82, 36), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "BND", "name": i18n.tr("Brunei Darussalam Dollar"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "KHR", "name": i18n.tr("Cambodia Riel"), "symbol": String.fromCharCode(6107), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "CAD", "name": i18n.tr("Canada Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "KYD", "name": i18n.tr("Cayman Islands Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "CLP", "name": i18n.tr("Chile Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "0", "format": "%s%v"})
			append({"code": "CNY", "name": i18n.tr("China Yuan Renminbi"), "symbol": String.fromCharCode(165), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
			append({"code": "COP", "name": i18n.tr("Colombia Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "0", "format": "%s%v"})
			append({"code": "CRC", "name": i18n.tr("Costa Rica Colon"), "symbol": String.fromCharCode(8353), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "HRK", "name": i18n.tr("Croatia Kuna"), "symbol": String.fromCharCode(107, 110), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "CUP", "name": i18n.tr("Cuba Peso"), "symbol": String.fromCharCode(8369), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "CZK", "name": i18n.tr("Czech Republic Koruna"), "symbol": String.fromCharCode(75, 269), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
			append({"code": "DKK", "name": i18n.tr("Denmark Krone"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": "", "precision": "2", "format": "%v %s"})
			append({"code": "DOP", "name": i18n.tr("Dominican Republic Peso"), "symbol": String.fromCharCode(82, 68, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "XCD", "name": i18n.tr("East Caribbean Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "EGP", "name": i18n.tr("Egypt Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SVC", "name": i18n.tr("El Salvador Colon"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "EUR", "name": i18n.tr("Euro Member Countries"), "symbol": String.fromCharCode(8364), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "FKP", "name": i18n.tr("Falkland Islands (Malvinas) Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "FJD", "name": i18n.tr("Fiji Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "GHS", "name": i18n.tr("Ghana Cedi"), "symbol": String.fromCharCode(162), "decimal": ".", "thousand": ",", "precision": "2", "format": ""})
			append({"code": "GIP", "name": i18n.tr("Gibraltar Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "GTQ", "name": i18n.tr("Guatemala Quetzal"), "symbol": String.fromCharCode(81), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "GGP", "name": i18n.tr("Guernsey Pound"), "symbol": String.fromCharCode(163), "decimal": "", "thousand": "", "precision": "2", "format": "%s%v"})
			append({"code": "GYD", "name": i18n.tr("Guyana Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "HNL", "name": i18n.tr("Honduras Lempira"), "symbol": String.fromCharCode(76), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "HKD", "name": i18n.tr("Hong Kong Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "HUF", "name": i18n.tr("Hungary Forint"), "symbol": String.fromCharCode(70, 116), "decimal": ",", "thousand": " ", "precision": "0", "format": "%s%v"})
			append({"code": "ISK", "name": i18n.tr("Iceland Krona"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "INR", "name": i18n.tr("India Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "IDR", "name": i18n.tr("Indonesia Rupiah"), "symbol": String.fromCharCode(82, 112), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "IRR", "name": i18n.tr("Iran Rial"), "symbol": String.fromCharCode(65020), "decimal": "/", "thousand": ",", "precision": "2", "format": "%v %s"})
			append({"code": "IMP", "name": i18n.tr("Isle of Man Pound"), "symbol": String.fromCharCode(163), "decimal": "", "thousand": "", "precision": "2", "format": "%s%v"})
			append({"code": "ILS", "name": i18n.tr("Israel Shekel"), "symbol": String.fromCharCode(8362), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "JMD", "name": i18n.tr("Jamaica Dollar"), "symbol": String.fromCharCode(74, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "JPY", "name": i18n.tr("Japan Yen"), "symbol": String.fromCharCode(165), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
			append({"code": "JEP", "name": i18n.tr("Jersey Pound"), "symbol": String.fromCharCode(163), "decimal": "", "thousand": "", "precision": "2", "format": "%s%v"})
			append({"code": "KZT", "name": i18n.tr("Kazakhstan Tenge"), "symbol": String.fromCharCode(1083, 1074), "decimal": "-", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "KPW", "name": i18n.tr("Korea (North) Won"), "symbol": String.fromCharCode(8361), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
			append({"code": "KRW", "name": i18n.tr("Korea (South) Won"), "symbol": String.fromCharCode(8361), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
			append({"code": "KGS", "name": i18n.tr("Kyrgyzstan Som"), "symbol": String.fromCharCode(1083, 1074), "decimal": "-", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "LAK", "name": i18n.tr("Laos Kip"), "symbol": String.fromCharCode(8365), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "LBP", "name": i18n.tr("Lebanon Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "LRD", "name": i18n.tr("Liberia Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "MKD", "name": i18n.tr("Macedonia Denar"), "symbol": String.fromCharCode(1076, 1077, 1085), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "MYR", "name": i18n.tr("Malaysia Ringgit"), "symbol": String.fromCharCode(82, 77), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "MUR", "name": i18n.tr("Mauritius Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "MXN", "name": i18n.tr("Mexico Peso"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "MNT", "name": i18n.tr("Mongolia Tughrik"), "symbol": String.fromCharCode(8366), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "MZN", "name": i18n.tr("Mozambique Metical"), "symbol": String.fromCharCode(77, 84), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "NAD", "name": i18n.tr("Namibia Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "NPR", "name": i18n.tr("Nepal Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "ANG", "name": i18n.tr("Netherlands Antilles Guilder"), "symbol": String.fromCharCode(402), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "NZD", "name": i18n.tr("New Zealand Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "NIO", "name": i18n.tr("Nicaragua Cordoba"), "symbol": String.fromCharCode(67, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "NGN", "name": i18n.tr("Nigeria Naira"), "symbol": String.fromCharCode(8358), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "NOK", "name": i18n.tr("Norway Krone"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
			append({"code": "OMR", "name": i18n.tr("Oman Rial"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "3", "format": "%v %s"})
			append({"code": "PKR", "name": i18n.tr("Pakistan Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "PAB", "name": i18n.tr("Panama Balboa"), "symbol": String.fromCharCode(66, 47, 46), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "PYG", "name": i18n.tr("Paraguay Guarani"), "symbol": String.fromCharCode(71, 115), "decimal": ",", "thousand": ".", "precision": "0", "format": "%v%s"})
			append({"code": "PEN", "name": i18n.tr("Peru Sol"), "symbol": String.fromCharCode(83, 47, 46), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "PHP", "name": i18n.tr("Philippines Piso"), "symbol": String.fromCharCode(8369), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "PLN", "name": i18n.tr("Poland Zloty"), "symbol": String.fromCharCode(122, 322), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
			append({"code": "QAR", "name": i18n.tr("Qatar Riyal"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
			append({"code": "RON", "name": i18n.tr("Romania Leu"), "symbol": String.fromCharCode(108, 101, 105), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "RUB", "name": i18n.tr("Russia Ruble"), "symbol": String.fromCharCode(8381), "decimal": ",", "thousand": " ", "precision": "2", "format": "%v %s"})
			append({"code": "SHP", "name": i18n.tr("Saint Helena Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SAR", "name": i18n.tr("Saudi Arabia Riyal"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
			append({"code": "RSD", "name": i18n.tr("Serbia Dinar"), "symbol": String.fromCharCode(1044, 1080, 1085, 46), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "SCR", "name": i18n.tr("Seychelles Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SGD", "name": i18n.tr("Singapore Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SBD", "name": i18n.tr("Solomon Islands Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SOS", "name": i18n.tr("Somalia Shilling"), "symbol": String.fromCharCode(83), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "ZAR", "name": i18n.tr("South Africa Rand"), "symbol": String.fromCharCode(82), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "LKR", "name": i18n.tr("Sri Lanka Rupee"), "symbol": String.fromCharCode(8360), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SEK", "name": i18n.tr("Sweden Krona"), "symbol": String.fromCharCode(107, 114), "decimal": ",", "thousand": ".", "precision": "2", "format": "%v %s"})
			append({"code": "CHF", "name": i18n.tr("Switzerland Franc"), "symbol": String.fromCharCode(67, 72, 70), "decimal": ".", "thousand": "'", "precision": "2", "format": ""})
			append({"code": "SRD", "name": i18n.tr("Suriname Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "SYP", "name": i18n.tr("Syria Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "TWD", "name": i18n.tr("Taiwan New Dollar"), "symbol": String.fromCharCode(78, 84, 36), "decimal": ".", "thousand": ",", "precision": "0", "format": "%s%v"})
			append({"code": "THB", "name": i18n.tr("Thailand Baht"), "symbol": String.fromCharCode(3647), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "TTD", "name": i18n.tr("Trinidad and Tobago Dollar"), "symbol": String.fromCharCode(84, 84, 36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "TRY", "name": i18n.tr("Turkey Lira"), "symbol": String.fromCharCode(8378), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			//~ append({"code": "TVD", "name": i18n.tr("Tuvalu Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "", "format": ""})
			append({"code": "UAH", "name": i18n.tr("Ukraine Hryvnia"), "symbol": String.fromCharCode(8372), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "GBP", "name": i18n.tr("United Kingdom Pound"), "symbol": String.fromCharCode(163), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "USD", "name": i18n.tr("United States Dollar"), "symbol": String.fromCharCode(36), "decimal": ".", "thousand": ",", "precision": "2", "format": "%s%v"})
			append({"code": "UYU", "name": i18n.tr("Uruguay Peso"), "symbol": String.fromCharCode(36), "decimal": ",", "thousand": ".", "precision": "0", "format": "%s%v"})
			append({"code": "UZS", "name": i18n.tr("Uzbekistan Som"), "symbol": String.fromCharCode(1083, 1074), "decimal": ",", "thousand": " ", "precision": "2", "format": "%s%v"})
			append({"code": "VEF", "name": i18n.tr("Venezuela Bolívar"), "symbol": String.fromCharCode(66, 115), "decimal": ",", "thousand": ".", "precision": "2", "format": "%s%v"})
			append({"code": "VND", "name": i18n.tr("Viet Nam Dong"), "symbol": String.fromCharCode(8363), "decimal": ",", "thousand": ".", "precision": "0", "format": "%v %s"})
			append({"code": "YER", "name": i18n.tr("Yemen Rial"), "symbol": String.fromCharCode(65020), "decimal": ".", "thousand": ",", "precision": "2", "format": "%v %s"})
			append({"code": "ZWL", "name": i18n.tr("Zimbabwe Dollar"), "symbol": String.fromCharCode(90, 36), "decimal": "", "thousand": "", "precision": "2", "format": "%s%v"})
		}
    }
    
    QtObject{
        id: ratesDataModel

        property var data: settings.ratesCacheJSON ? JSON.parse(settings.ratesCacheJSON) : ""
        property string appID: "624288a2010b46efa678686799b33599" //openexchangerates app ID
        property string requestURL: encodeURI("https://openexchangerates.org/api/latest.json?app_id=" + appID)
        
        function fetchCacheJSON(callback){
            var xhr = new XMLHttpRequest();
            var resultData

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
            };

            xhr.open('GET', Qt.resolvedUrl("../../data/rates.json"), true);
            xhr.send();

        }


        function fetchLatestJSON(callback){
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        console.log("exchange rate fetch success")
                        tempSettings.exchangeRateJSON = xhr.responseText
                        tempSettings.exchangeRateDate = Process.getToday()
                        callback(true)
                    }
                    else {
                        console.log('Failed to fetch exchange rate list');
                        callback(false)
                    }
                }
            };

            xhr.open('GET', requestURL, true);
            xhr.send();

        }
    }
}

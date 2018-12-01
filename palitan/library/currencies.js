//~ .pragma library
.import "accounting.js"  as Accounting

var money = function(data, moneyValue){
	
	var returnObj = {
		code : data.code
		,name : data.name
		,symbol : data.symbol
		,decimal : data.decimal
		,thousand : data.thousand
		,precision : data.precision
		,format : data.format
		,formattedMoney: function(value, noSymbol){
				var options = {
					symbol : noSymbol ? "" : this.symbol,
					decimal : this.decimal,
					thousand: this.thousand,
					precision : this.precision,
					format: this.format
				};
				return formatMoney(value, options, noSymbol)				
		
				//~ return Accounting.accounting.formatMoney(value, options);
			}
		,formattedValue: function() {
				//~ var result;
			
				//~ switch (settings.currencyFormatting){
					//~ //None
					//~ case 0:
						//~ result = this.value + " " + this.code
					//~ break
					//~ //Native
					//~ case 1:
						//~ result = this.formattedMoney(this.value)
					//~ break
					//~ //Home currency
					//~ case 2:
						//~ result = settings.homeCurrencyData.formattedMoney(this.value, true)  + " " + this.code
					//~ break
					//~ //Alternate currency
					//~ case 3:
						//~ result = settings.alternateCurrencyData.formattedMoney(this.value, true) + " " + this.code
					//~ break
					//~ default:
						//~ result = this.value + " " + this.code
					//~ break
				//~ };
				
				//~ return result;
				var options = {
					symbol : this.symbol,
					decimal : this.decimal,
					thousand: this.thousand,
					precision : this.precision,
					format: this.format
				};
				return displayMoney(this.value, options)
			}
		,convert: function(destinationCode) {
				var ratesData = mainModels.ratesDataModel.data
				var result
	
				//~ console.log("value: " + this.value)
				result = (this.value / ratesData.rates[this.code]) * ratesData.rates[destinationCode];
				
				if(!isNaN(result)){
					//~ return this.formattedValue(result)
					return displayMoney(result, destinationCode)
				}else{
					return null
				}
		    }
		,rate: function(destinationCode){
			var ratesData = mainModels.ratesDataModel.data
			
			return (1 / ratesData.rates[this.code]) * ratesData.rates[destinationCode];
		}
		,value: moneyValue
	};

	return returnObj
}

// To currency format based on settings
// codeOptions: This can be currency code or options object containing the format details
function displayMoney(value, codeOptions){
	var result;
			
	switch (settings.currencyFormatting){
		//None
		case 0:
			result = value
		break
		//Native
		case 1:
			result = formatMoney(value, codeOptions)
		break
		//Home currency
		case 2:
			result = settings.homeCurrencyData.formattedMoney(value, true)
		break
		//Alternate currency
		case 3:
			result = settings.alternateCurrencyData.formattedMoney(value, true)
		break
		default:
			result = value
		break
	};
	
	return result;
}

// To native currency format
// codeOptions: This can be currency code or options object containing the format details
function formatMoney(value, codeOptions, noSymbol){
	var options
	
	if(codeOptions.format){
		options = codeOptions
	}else{
		var ratesData = mainModels.currencyModel2.getItem(codeOptions,"code")
		
		options = {
			symbol : noSymbol ? "" : ratesData.symbol,
			decimal : ratesData.decimal,
			thousand: ratesData.thousand,
			precision : ratesData.precision,
			format: ratesData.format
		};
	}

	return Accounting.accounting.formatMoney(value, options);
}

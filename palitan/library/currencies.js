.import "accounting.js"  as Accounting

var currency = function(data){
	
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
	
			return Accounting.accounting.formatMoney(value, options);
		}
	};

	return returnObj
}

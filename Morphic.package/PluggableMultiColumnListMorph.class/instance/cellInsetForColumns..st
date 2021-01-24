layout
cellInsetForColumns: someSymbols
	"Cache the preferred inset of items per column because column count can vary."
	
	self setProperty: #cellInsetForColumns toValue: someSymbols.
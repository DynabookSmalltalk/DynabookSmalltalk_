layout
cellPositioningForColumns: someSymbols
	"Cache the preferred positioning of items per column because column count can vary."
	
	self setProperty: #cellPositioningForColumns toValue: someSymbols.
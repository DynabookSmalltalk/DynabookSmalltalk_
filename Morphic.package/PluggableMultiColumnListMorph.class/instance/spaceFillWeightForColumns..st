layout
spaceFillWeightForColumns: someSymbols
	"Cache the preferred space-fill weight for each column because column count can vary."
	
	self setProperty: #spaceFillWeightForColumns toValue: someSymbols.
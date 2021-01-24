layout
hResizingForColumns: someSymbols
	"Cache the preferred horizontal resizing for each column because column count can vary."
	
	self setProperty: #hResizingForColumns toValue: someSymbols.
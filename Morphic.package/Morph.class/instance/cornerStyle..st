rounding
cornerStyle: aSymbol
	"This method makes it possible to set up desired corner style. aSymbol has to be one of:
		#square
		#rounded"

	self setProperty: #cornerStyle toValue: aSymbol.
	self changed.
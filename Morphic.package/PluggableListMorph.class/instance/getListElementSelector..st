accessing - selectors
getListElementSelector: aSymbol
	"specify a selector that can be used to obtain a single element in the underlying list"

	getListElementSelector = aSymbol ifTrue: [^self].
	getListElementSelector := aSymbol.
	self updateList.
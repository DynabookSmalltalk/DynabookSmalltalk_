accessing - selectors
getListSizeSelector: aSymbol
	"specify a selector that can be used to specify the list's size"

	getListSizeSelector = aSymbol ifTrue: [^ self].
	getListSizeSelector := aSymbol.
	self updateList.
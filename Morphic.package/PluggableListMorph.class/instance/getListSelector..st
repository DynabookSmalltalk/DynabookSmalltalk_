accessing - selectors
getListSelector: aSymbol 
	"Set the receiver's getListSelector as indicated, and trigger a recomputation of the list"
	
	getListSelector = aSymbol ifTrue: [^ self].
	getListSelector := aSymbol.
	self updateList.
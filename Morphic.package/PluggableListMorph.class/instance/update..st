updating
update: aSymbol 

	aSymbol == getListSelector ifTrue: [^ self updateList].
	aSymbol == getIndexSelector ifTrue: [^ self updateListSelection].
	
	"The following selectors are rarely used."
	aSymbol == getListSizeSelector ifTrue: [^ self updateList].
	aSymbol == getListElementSelector ifTrue: [^ self updateList].
model access
getCurrentSelectionIndex
	"Answer the index of the current selection."

	^ getIndexSelector
		ifNil: [0]
		ifNotNil: [self getFullList indexOf: (model perform: getIndexSelector)]
updating
update: aSymbol 

	aSymbol == #allSelections ifTrue: [
		"Convenient - yet hard-coded - way to refresh all selections."
		super update: getIndexSelector.
		^ self changed].
	aSymbol == getSelectionListSelector ifTrue: [
		^ self changed].
	
	super update: aSymbol.
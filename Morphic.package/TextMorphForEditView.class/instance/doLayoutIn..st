layout
doLayoutIn: layoutBounds

	| shouldRestoreSelection |
	self flag: #workaround. "mt: The combination of 'releaseParagraph; paragraph' resets the selection. We should find a better way for this in the future. Sigh...."
	
	shouldRestoreSelection := paragraph isNil.
	
	super doLayoutIn: layoutBounds.
	
	shouldRestoreSelection ifTrue: [
		self editView ifNotNil: [:view |
			view restoreSelectionInterval]].
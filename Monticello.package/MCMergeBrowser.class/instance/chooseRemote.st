actions
chooseRemote
	self conflictSelectionDo:
		[selection chooseRemote.
		self changed: #text; changed: #list; changed: #canMerge].
	self selectNextUnresolvedConflict
actions
chooseLocal
	self conflictSelectionDo:
		[selection chooseLocal.
		self changed: #text; changed: #list; changed: #canMerge].
	self selectNextUnresolvedConflict
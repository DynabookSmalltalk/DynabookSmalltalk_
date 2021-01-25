button commands
save

	self isSaving: true.
	notesIndex = 0
		ifTrue: [self saveSound]
		ifFalse: [self saveName].
	self isSaving: false.
unaccepted edits
hasUnacceptedEdits: wasJustEdited

	wasJustEdited = hasUnacceptedEdits ifFalse: [
		hasUnacceptedEdits := wasJustEdited.
		self changed].

	wasJustEdited
		ifTrue: [self hasUserEdited: true]
		ifFalse: [self hasEditingConflicts: false].
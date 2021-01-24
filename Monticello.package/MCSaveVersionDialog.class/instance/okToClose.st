actions
okToClose
	^ (self findTextMorph: #logMessage)
		ifNil: [true]
		ifNotNil:
			[:widget | widget canDiscardEdits or: [self confirm: 'Version notes are not saved.
Is it OK to discard those notes?' translated]]
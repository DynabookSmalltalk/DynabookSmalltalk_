event handling
keyStroke: evt
	| view |
	
	editView deleteBalloon.
	self editor model: editView model.  "For evaluateSelection"
	view := editView.  "Copy into temp for case of a self-mutating doit"
	(acceptOnCR and: [evt keyCharacter = Character cr])
		ifTrue: [^ self editor accept].

	view hasUserEdited: false.
	super keyStroke: evt.
	view scrollSelectionIntoView.
	
	view hasUserEdited
		ifTrue: [	view textEdited: self contents].
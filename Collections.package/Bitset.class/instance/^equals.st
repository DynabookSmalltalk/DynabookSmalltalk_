comparing
= anObject

	self species == anObject species ifFalse: [ ^false ].
	anObject size = tally ifFalse: [ ^false ].
	^anObject bytes = bytes
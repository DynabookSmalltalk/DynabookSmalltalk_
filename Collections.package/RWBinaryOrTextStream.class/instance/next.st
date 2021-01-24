accessing
next

	isBinary ifFalse: [ ^super next ].
	^super next ifNotNil: [ :character | character asInteger ]
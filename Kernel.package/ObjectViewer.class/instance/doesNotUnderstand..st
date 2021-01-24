very few messages
doesNotUnderstand: aMessage 
	"Check for change after sending aMessage"
	| returnValue newValue |
	recursionFlag ifTrue: [^ aMessage sendTo: tracedObject].
	recursionFlag := true.
	returnValue := aMessage sendTo: tracedObject.
	newValue := valueBlock cull: aMessage.
	newValue = lastValue ifFalse:
		[changeBlock cull: aMessage.
		lastValue := newValue].
	recursionFlag := false.
	^ returnValue
primitives
indexOfAscii: anInteger inString: aString startingAt: start

	| stringSize |
	<primitive: 'primitiveIndexOfAsciiInString' module: 'MiscPrimitivePlugin'>
	<var: #aString type: #'unsigned char *'>

	stringSize := aString size.
	start to: stringSize do: [:pos |
		(aString basicAt: pos) = anInteger ifTrue: [^ pos]].

	^ 0
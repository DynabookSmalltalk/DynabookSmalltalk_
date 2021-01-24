public
appendToPreamble: aString
	preamble
		ifNil: [preamble := aString]
		ifNotNil: [preamble := preamble, aString].

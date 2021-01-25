private
primDisplayString: aString from: startIndex to: stopIndex map: glyphMap xTable: xTable kern: kernDelta
	| ascii |
	<primitive:'primitiveDisplayString' module:'BitBltPlugin'>

	((sourceForm isForm) and: [sourceForm unhibernate])
		ifTrue: [^ self primDisplayString: aString from: startIndex to: stopIndex map: glyphMap xTable: xTable kern: kernDelta].
	((destForm isForm) and: [destForm unhibernate])
		ifTrue: [^ self primDisplayString: aString from: startIndex to: stopIndex map: glyphMap xTable: xTable kern: kernDelta].
	((halftoneForm isForm) and: [halftoneForm unhibernate])
		ifTrue: [^ self primDisplayString: aString from: startIndex to: stopIndex map: glyphMap xTable: xTable kern: kernDelta].

	startIndex to: stopIndex do:[:charIndex|
		ascii := (aString at: charIndex) asciiValue.
		glyphMap ifNotNil:[ascii := glyphMap at: ascii+1].
		sourceX := xTable at: ascii + 1.
		width := (xTable at: ascii + 2) - sourceX.
		self copyBits.
		destX := destX + width + kernDelta.
	].
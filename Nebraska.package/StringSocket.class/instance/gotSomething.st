private-IO
gotSomething

	numStringsInNextArray ifNil: [^self tryForNumStringsInNextArray ].
	numStringsInNextArray = 0 ifTrue: [
		inObjects add: #().
		numStringsInNextArray := nil.
		^true ].
	nextStringSize ifNil: [^ self tryForNextStringSize ].
	^self tryForString

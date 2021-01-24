operations
patchMessageStripped: aString
	| pos |
	pos := aString findString: self patchMessageChangesDelimiter.
	^ (pos > 0
		ifTrue: [aString first: pos - 1]
		ifFalse: [aString]) withBlanksTrimmed
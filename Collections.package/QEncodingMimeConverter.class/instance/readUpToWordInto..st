private-encoding
readUpToWordInto: aStream

	| currentCharacter |
	[dataStream atEnd] whileFalse:
		[currentCharacter := dataStream peek.
		 currentCharacter isSeparator 
			ifTrue: [aStream nextPut: currentCharacter.
					dataStream next]
			ifFalse: [^ true]]
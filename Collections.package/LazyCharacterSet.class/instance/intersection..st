enumerating
intersection: aCollection
	^((self isCharacters: aCollection)
		ifTrue: [aCollection select: block]
		ifFalse:
			["protect feeding block with non character"
			aCollection select: [:e |e isCharacter and: [block value: e]]]) as: CharacterSet
		
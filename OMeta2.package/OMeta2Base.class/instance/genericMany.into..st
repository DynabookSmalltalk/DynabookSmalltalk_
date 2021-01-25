private
genericMany: aBlock into: anOrderedCollection

	[
		| origInput |
		origInput := input.
		[anOrderedCollection addLast: aBlock value] on: OM2Fail do: [
			input := origInput.
			^ anOrderedCollection
		].
		true
	] whileTrue
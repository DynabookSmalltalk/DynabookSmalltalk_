private
not: aBlock

	| origInput |
	origInput := input.
	[aBlock value] on: OM2Fail do: [
		input := origInput.
		^ true
	].
	OMeta2Fail signal
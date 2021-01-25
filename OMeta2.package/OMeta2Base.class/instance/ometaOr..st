private
ometaOr: choices

	| origInput |
	origInput := input.
	choices do: [:choice |
		input := origInput.
		[^ choice value] on: OM2Fail do: []
	].
	OMeta2Fail signal
private
consumedBy: aBlock

	| origInput i ws |
	origInput := input.
	aBlock value.
	ws := WriteStream on: origInput inputSpecies new.
	i := origInput.
	[i == input] whileFalse: [
		ws nextPut: i head.
		i := i tail
	].
	^ ws contents
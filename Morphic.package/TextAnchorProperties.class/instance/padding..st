accessing - padding
padding: numberOrPointOrRectangle

	| newPadding |
	newPadding := numberOrPointOrRectangle.
	newPadding isPoint ifTrue: [
		newPadding := newPadding corner: newPadding].
	newPadding isNumber ifTrue: [
		newPadding := newPadding@newPadding corner: newPadding@newPadding].
	^ padding := newPadding
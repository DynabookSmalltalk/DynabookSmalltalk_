layout
layout: aMorph in: layoutBounds
	"Compute the layout for the given morph based on the new bounds"

	aMorph submorphsDo: [:m |
		m
			layoutProportionallyInBounds: layoutBounds
			positioning: aMorph cellPositioning].
cursor
selectedRect
	"Return a rectangle enclosing the morph at the current cursor. Note that the cursor may be a float and may be out of range, so pick the nearest morph. Assume there is at least one submorph."

	| p |
	p := cursor asInteger.
	p := p min: submorphs size.
	p := p max: 1.
	^(submorphs at: p) fullBounds expandBy: 2
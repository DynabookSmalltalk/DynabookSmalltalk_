filtering
filterColumnIndex
	"Which column to apply the filter to?"

	| i |
	i := 0.
	self listMorphs
		detect: [:m | i := i + 1. m backgroundColor notNil]
		ifNone: [i := 0].
	^ i
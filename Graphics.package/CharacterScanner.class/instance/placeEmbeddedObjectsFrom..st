private-text-anchor
placeEmbeddedObjectsFrom: textAttributes
	textAttributes do: [:attr |
		"Try to placeEmbeddedObject: - if it answers false, then there's no place left"
		(self placeEmbeddedObjectFrom: attr) ifFalse: [^ self crossedX]].
	^ false
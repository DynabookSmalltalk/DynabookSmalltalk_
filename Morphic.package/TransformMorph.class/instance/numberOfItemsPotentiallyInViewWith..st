geometry
numberOfItemsPotentiallyInViewWith: submorphCount
	"Answer the number of items that could potentially be viewed in full,
	computed as my visible height divided by the average height of my submorphs.
	Ignore visibility of submorphs."

	^ self localSubmorphBounds
		ifNil: [0]
		ifNotNil: [:lsBounds |
			self innerBounds height // (lsBounds height / submorphCount)]
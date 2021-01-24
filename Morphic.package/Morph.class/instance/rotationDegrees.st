rotate scale and flex
rotationDegrees

	self isFlexed ifFalse: [^ 0.0].
	self owner in: [:flexShell | ^ flexShell rotationDegrees].
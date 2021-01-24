rotate scale and flex
rotationDegrees: degrees

	self isFlexed ifFalse: [self addFlexShell].
	self owner in: [:flexShell | flexShell rotationDegrees: degrees].
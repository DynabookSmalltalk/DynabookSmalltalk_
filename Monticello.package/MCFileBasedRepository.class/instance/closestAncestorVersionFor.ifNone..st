accessing
closestAncestorVersionFor: anAncestry ifNone: errorBlock
	^ self cacheAllFileNamesDuring:
		[super closestAncestorVersionFor: anAncestry ifNone: errorBlock]
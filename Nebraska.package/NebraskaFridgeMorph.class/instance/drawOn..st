drawing
drawOn: aCanvas

	| f cache |
	f := self class fridgeForm ifNil: [^super drawOn: aCanvas].
	cache := Form extent: bounds extent depth: aCanvas depth.
	f
		displayInterpolatedIn: cache boundingBox truncated
		on: cache.
	cache replaceColor: Color black withColor: Color transparent.
	aCanvas 
		translucentImage: cache
		at: bounds origin.

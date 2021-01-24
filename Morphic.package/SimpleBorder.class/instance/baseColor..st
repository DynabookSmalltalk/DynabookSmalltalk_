accessing
baseColor: aColor

	baseColor = aColor ifTrue:[^self].
	baseColor := aColor ifNil: [Color transparent].
	self color: baseColor "#color: will do  #releaseCachedState"
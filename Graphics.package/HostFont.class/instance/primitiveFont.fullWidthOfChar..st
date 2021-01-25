primitives
primitiveFont: fontHandle fullWidthOfChar: aCharIndex 
	<primitive:'primitiveFontFullWidthOfChar' module:'FontPlugin'>
	^Array 
		with: 0
		with: (self primitiveFont: fontHandle widthOfChar: aCharIndex)
		with: 0
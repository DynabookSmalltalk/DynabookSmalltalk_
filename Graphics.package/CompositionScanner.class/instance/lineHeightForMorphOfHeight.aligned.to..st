private
lineHeightForMorphOfHeight: aMorphHeight aligned: morphPosition to: linePosition 
	
	^ self
		lineHeightForMorphOfHeight: aMorphHeight
		aligned: morphPosition 
		to: linePosition
		paddedWith: 0
		andOptionalMorphBaseline: 0
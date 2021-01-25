*nebraska-encoding
addDeltasFrom: previousForm

	(BitBlt 
		destForm: self 
		sourceForm: previousForm 
		fillColor: nil 
		combinationRule: Form reverse
		destOrigin: 0@0
		sourceOrigin: 0@0
		extent: self extent 
		clipRect: self boundingBox) copyBits.
	^self
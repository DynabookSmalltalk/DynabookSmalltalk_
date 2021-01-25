*nebraska-encoding
deltaFrom: previousForm

	| newForm |
	newForm := previousForm deepCopy.
	(BitBlt 
		destForm: newForm 
		sourceForm: self 
		fillColor: nil 
		combinationRule: Form reverse 
		destOrigin: 0@0
		sourceOrigin: 0@0
		extent: self extent 
		clipRect: self boundingBox) copyBits.
	^newForm
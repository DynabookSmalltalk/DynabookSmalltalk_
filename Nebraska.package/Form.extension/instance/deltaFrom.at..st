*nebraska-encoding
deltaFrom: smallerForm at: offsetInMe

	| newForm |
	newForm := smallerForm deepCopy.
	(BitBlt 
		destForm: newForm 
		sourceForm: self 
		fillColor: nil 
		combinationRule: Form reverse 
		destOrigin: 0@0
		sourceOrigin: offsetInMe
		extent: smallerForm extent 
		clipRect: newForm boundingBox) copyBits.
	^newForm
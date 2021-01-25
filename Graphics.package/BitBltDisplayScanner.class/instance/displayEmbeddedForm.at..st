displaying
displayEmbeddedForm: aForm at: aPoint

	aForm 
		displayOn: bitBlt destForm 
		at: aPoint
		clippingBox: bitBlt clipRect
		rule: Form blend
		fillColor: Color white 
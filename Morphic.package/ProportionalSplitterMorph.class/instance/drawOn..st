drawing
drawOn: aCanvas

	super drawOn: aCanvas.
	
	self showHandle ifTrue: [
		self splitsLeftAndRight ifTrue: [
			aCanvas
				fillRoundRect: (((self width - (self handleInset * 2) max: 1) @ (self height * 0.25 min: self class handleLength)) center: self center)
				radius: 3
				fillStyle: (SolidFillStyle color: self handleColor)].
		self splitsTopAndBottom ifTrue: [
			aCanvas
				fillRoundRect: (((self width * 0.25 min: self class handleLength) @ (self height - (self handleInset * 2) max: 1)) center: self center)
				radius: 3
				fillStyle: (SolidFillStyle color: self handleColor)] ].
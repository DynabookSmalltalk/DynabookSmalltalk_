drawing
drawOn: aCanvas

	super drawOn: aCanvas.
	
	self showHandle ifTrue: [
		self orientation = #vertical ifTrue: [
			aCanvas
				fillRoundRect: (((self width @ (self height * 0.25 min: self class handleLength)) center: self center) insetBy: self handleInset)
				radius: 3
				fillStyle: (SolidFillStyle color: self handleColor)].
		self orientation = #horizontal ifTrue: [
			aCanvas
				fillRoundRect: ((((self width * 0.25 min: self class handleLength) @ self height) center: self center) insetBy: self handleInset)
				radius: 3
				fillStyle: (SolidFillStyle color: self handleColor)] ].
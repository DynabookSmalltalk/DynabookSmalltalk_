drawing
drawOn: aCanvas

	super drawOn: aCanvas.
	
	self showHandle ifTrue: [
		aCanvas
			fillRoundRect: ((self topLeft + self handleInset asPoint extent: self class gripThickness @ self height) insetBy: self handleInset)
			radius: 3
			fillStyle: (SolidFillStyle color: self handleColor).
		aCanvas
			fillRoundRect: ((self topLeft + self handleInset asPoint extent: self width @ self class gripThickness) insetBy: self handleInset)
			radius: 3
			fillStyle: (SolidFillStyle color: self handleColor).
		
		
		].
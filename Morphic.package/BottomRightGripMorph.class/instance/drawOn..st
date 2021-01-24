drawing
drawOn: aCanvas

	super drawOn: aCanvas.
	
	self showHandle ifTrue: [
		aCanvas
			fillRoundRect: ((self topRight + ((self handleInset negated + self class gripThickness negated) @ self handleInset negated) extent: self class gripThickness @ self height) insetBy: self handleInset)
			radius: 3
			fillStyle: (SolidFillStyle color: self handleColor).
		aCanvas
			fillRoundRect: ((self bottomLeft + (self handleInset negated @ (self handleInset negated + self class gripThickness negated)) extent: self width @ self class gripThickness) insetBy: self handleInset)
			radius: 3
			fillStyle: (SolidFillStyle color: self handleColor).]
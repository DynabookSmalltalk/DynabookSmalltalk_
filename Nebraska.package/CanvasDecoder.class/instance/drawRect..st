decoding
drawRect: command 
	| verb rectEnc fillColorEnc borderWidthEnc borderColorEnc rect fillColor borderWidth borderColor |
	verb := command first.
	rectEnc := command second.
	fillColorEnc := command third.
	borderWidthEnc := command fourth.
	borderColorEnc := command fifth.
	""
	rect := self class decodeRectangle: rectEnc.
	fillColor := self class decodeColor: fillColorEnc.
	borderWidth := self class decodeInteger: borderWidthEnc.
	borderColor := self class decodeColor: borderColorEnc.
	""
	self
		drawCommand: [:c | c
				frameAndFillRectangle: rect
				fillColor: fillColor
				borderWidth: borderWidth
				borderColor: borderColor]
decoding
drawOval: command 
	| verb rectEnc colorEnc borderWidthEnc borderColorEnc rect color borderWidth borderColor |
	verb := command first.
	rectEnc := command second.
	colorEnc := command third.
	borderWidthEnc := command fourth.
	borderColorEnc := command fifth.
	""
	rect := self class decodeRectangle: rectEnc.
	color := self class decodeColor: colorEnc.
	borderWidth := self class decodeInteger: borderWidthEnc.
	borderColor := self class decodeColor: borderColorEnc.
	""
	self
		drawCommand: [:c | c
				fillOval: rect
				color: color
				borderWidth: borderWidth
				borderColor: borderColor]
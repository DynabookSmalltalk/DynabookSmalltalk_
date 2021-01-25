decoding
drawText: command 
	| boundsEnc colorEnc text bounds color fontIndexEnc fontIndex |
	text := command second.
	boundsEnc := command third.
	fontIndexEnc := command fourth.
	colorEnc := command fifth.
	bounds := self class decodeRectangle: boundsEnc.
	fontIndex := self class decodeInteger: fontIndexEnc.
	color := self class decodeColor: colorEnc.
	self drawCommand: 
			[:c | 
			c 
				drawString: text
				in: bounds
				font: (fonts at: fontIndex)
				color: color]
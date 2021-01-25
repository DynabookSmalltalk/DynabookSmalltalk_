decoding
drawBalloonOval: command 
	| aRectangle aFillStyle borderWidth borderColor |
	aRectangle := self class decodeRectangle: command second.
	aFillStyle := self class decodeFillStyle: command third.
	borderWidth := self class decodeInteger: command fourth.
	borderColor := self class decodeColor: (command fifth).
	self drawCommand: 
			[:c | 
			c asBalloonCanvas 
				fillOval: aRectangle
				fillStyle: aFillStyle
				borderWidth: borderWidth
				borderColor: borderColor]
decoding
drawBalloonRect: command 
	| aRectangle aFillStyle |
	aRectangle := self class decodeRectangle: (command second).
	aFillStyle := self class decodeFillStyle: command third.
	self drawCommand: 
			[:c | 
			c asBalloonCanvas fillRectangle: aRectangle fillStyle: aFillStyle]
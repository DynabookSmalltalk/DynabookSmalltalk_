decoding
drawInfiniteFill: command 
	| aRectangle aFillStyle |
	aRectangle := self class decodeRectangle: (command second).
	aFillStyle := InfiniteForm with: (self class decodeImage: command third).
	self drawCommand: 
			[:c | 
			c asBalloonCanvas fillRectangle: aRectangle fillStyle: aFillStyle]
decoding
drawStencil: command 
	| stencilFormEnc locationEnc sourceRectEnc colorEnc stencilForm location sourceRect color |
	stencilFormEnc := command second.
	locationEnc := command third.
	sourceRectEnc := command fourth.
	colorEnc := command fifth.
	stencilForm := self class decodeImage: stencilFormEnc.
	location := self class decodePoint: locationEnc.
	sourceRect := self class decodeRectangle: sourceRectEnc.
	color := self class decodeColor: colorEnc.
	self drawCommand: 
			[:executor | 
			executor 
				stencil: stencilForm
				at: location
				sourceRect: sourceRect
				color: color]
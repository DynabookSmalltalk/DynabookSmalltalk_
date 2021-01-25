decoding
shadowColor: command

	drawingCanvas shadowColor: (
		command second = '0' ifTrue: [nil] ifFalse: [self class decodeColor: command second]
	)

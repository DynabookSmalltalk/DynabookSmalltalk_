decoding
drawLine: command 
	| verb pt1Enc pt2Enc widthEnc colorEnc pt1 pt2 width color |
	verb := command first.
	pt1Enc := command second.
	pt2Enc := command third.
	widthEnc := command fourth.
	colorEnc := command fifth.
""
	pt1 := self class decodePoint: pt1Enc.
	pt2 := self class decodePoint: pt2Enc.
	width := self class decodeInteger: widthEnc.
	color := self class decodeColor: colorEnc.
""
	self
		drawCommand: [:c | c
				line: pt1
				to: pt2
				width: width
				color: color]
decoding
drawMultiText: command

	| boundsEnc colorEnc  text bounds color fontIndexEnc fontIndex |

	text := WideString fromByteArray: (command at: 2) asByteArray.
	"text asByteArray printString displayAt: 800@0."
	"self halt."
	boundsEnc := command at: 3.
	fontIndexEnc := command at: 4.
	colorEnc := command at: 5.


	bounds := self class decodeRectangle: boundsEnc.
	fontIndex := self class decodeInteger: fontIndexEnc.
	color := self class decodeColor: colorEnc.

	self drawCommand: [ :c |
		c drawString: text in: bounds font: (fonts at: fontIndex) color: color ]

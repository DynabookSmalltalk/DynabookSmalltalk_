*nebraska-instance creation
fromRemoteCanvasEncoding: encoded
	"DisplayTransform fromRemoteCanvasEncoding:  'Morphic,-88,-128,1.345165663873898,0.1352584843149221'"
	| type offsetXEnc offsetYEnc scaleEnc angleEnc offsetX offsetY angle scale rs |

	"separate the numbers"
	rs := ReadStream on: encoded.
	type := rs upTo: $,.
	offsetXEnc := rs upTo: $,.
	offsetYEnc := rs upTo: $,.
	scaleEnc := rs upTo: $,.
	angleEnc := rs upToEnd.

	"decode the numbers"
	offsetX := Integer readFromString: offsetXEnc.
	offsetY := Integer readFromString: offsetYEnc.

	scale := Number readFromString: scaleEnc.
	angle := Number readFromString: angleEnc.

	"create an instance"
	^self offset: offsetX@offsetY angle: angle scale: scale
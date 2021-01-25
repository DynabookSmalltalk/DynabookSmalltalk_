as yet unclassified
timeSomeThings
"
CanvasEncoder timeSomeThings
"
	| answer array color iter |

	iter := 1000000.
	array := Array new: 4.
	color := Color red.
	answer := String streamContents: [ :strm | | bm rect writer pt s |
		writer := [ :msg :doer | | ms |
			ms := [iter timesRepeat: doer] timeToRun.
			strm nextPutAll: msg,((ms * 1000 / iter) printShowingMaxDecimalPlaces: 2),' usec'; cr.
		].
		s := String new: 4.
		bm := Bitmap new: 20.
		pt := 100@300.
		rect := pt extent: pt.
	iter := 1000000.
		writer value: 'empty loop ' value: [self].
		writer value: 'modulo ' value: [12345678 \\ 256].
		writer value: 'bitAnd: ' value: [12345678 bitAnd: 255].
		strm cr.
	iter := 100000.
		writer value: 'putInteger ' value: [s putInteger32: 12345678 at: 1].
		writer value: 'bitmap put ' value: [bm at: 1 put: 12345678].
		writer value: 'encodeBytesOf: (big) ' value: [bm encodeInt: 12345678 in: bm at: 1].
		writer value: 'encodeBytesOf: (small) ' value: [bm encodeInt: 5000 in: bm at: 1].
		writer value: 'array at: (in) ' value: [array at: 1].
		writer value: 'array at: (out) ' value: [array at: 6 ifAbsent: []].
		strm cr.
	iter := 10000.
		writer value: 'color encode ' value: [color encodeForRemoteCanvas].
		writer value: 'pt encode ' value: [pt encodeForRemoteCanvas].
		writer value: 'rect encode ' value: [self encodeRectangle: rect].
		writer value: 'rect encode2 ' value: [rect encodeForRemoteCanvas].
		writer value: 'rect encodeb ' value: [rect encodeForRemoteCanvasB].
	].

	StringHolder new contents: answer; openLabel: 'send/receive stats'.

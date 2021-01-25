*nebraska-instance creation
fromRemoteCanvasEncoding: encoded
	| type |
	"decode a transform from the given encoded string"
	type := (ReadStream on: encoded) upTo: $,.
	type = 'Morphic' ifTrue: [
		^MorphicTransform fromRemoteCanvasEncoding: encoded ].
	type = 'Matrix' ifTrue: [
		^MatrixTransform2x3 fromRemoteCanvasEncoding: encoded ].
	type = 'Composite' ifTrue: [
		^CompositeTransform fromRemoteCanvasEncoding: encoded ].
	^self error: 'invalid transform encoding'
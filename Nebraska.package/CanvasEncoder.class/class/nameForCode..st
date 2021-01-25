as yet unclassified
nameForCode: aStringOrChar

	| ch |
	ch := (aStringOrChar isString) ifTrue: [aStringOrChar first] ifFalse: [aStringOrChar].
	ch == self codeBalloonOval ifTrue: [^'balloon oval'].
	ch == self codeBalloonRect ifTrue: [^'balloon rectangle'].
	ch == self codeClip ifTrue: [^'clip'].
	ch == self codeExtentDepth ifTrue: [^'codeExtentDepth'].
	ch == self codeFont ifTrue: [^'codeFont'].
	ch == self codeTTCFont ifTrue: [^'codeTTCFont'].
	ch == self codeForce ifTrue: [^'codeForce'].
	ch == self codeImage ifTrue: [^'codeImage'].
	ch == self codeLine ifTrue: [^'codeLine'].
	ch == self codeOval ifTrue: [^'codeOval'].
	ch == self codePoly ifTrue: [^'codePoly'].
	ch == self codeRect ifTrue: [^'codeRect'].
	ch == self codeReleaseCache ifTrue: [^'codeReleaseCache'].
	ch == self codeStencil ifTrue: [^'codeStencil'].
	ch == self codeText ifTrue: [^'codeText'].
	ch == self codeTransform ifTrue: [^'codeTransform'].
	ch == self codeInfiniteFill ifTrue: [^'codeInfiniteFill'].
	ch == self codeShadowColor ifTrue: [^'shadowColor'].
	^'????'

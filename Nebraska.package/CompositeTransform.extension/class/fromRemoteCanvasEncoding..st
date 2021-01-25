*nebraska-instance creation
fromRemoteCanvasEncoding: encoding
	| firstStart firstEnd firstEncoding firstTransform secondStart secondEnd secondEncoding secondTransform |
	"format: Composite,(enc1)(enc2)"

	"decode the first encoding"
	firstStart := encoding indexOf: $(.
	firstStart = 0 ifTrue: [ self error: 'invalid encoding' ].
	firstEnd := encoding findCloseParenthesisFor: firstStart.
	firstEncoding := encoding copyFrom: firstStart+1 to: firstEnd-1.
	firstTransform := DisplayTransform fromRemoteCanvasEncoding: firstEncoding.

	"decode the second encoding"
	secondStart := firstEnd + 1.
	(encoding at: secondStart) = $( ifFalse: [ ^self error: 'invalid encoding' ].
	secondEnd := encoding findCloseParenthesisFor: secondStart.
	secondEncoding := encoding copyFrom: secondStart+1 to: secondEnd-1.
	secondTransform := DisplayTransform fromRemoteCanvasEncoding: secondEncoding.
	

	"put it together"
	^self globalTransform: firstTransform localTransform: secondTransform
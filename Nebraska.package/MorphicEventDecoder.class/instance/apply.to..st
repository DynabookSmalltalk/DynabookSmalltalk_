handling messages
apply: aStringArray to: aHand
	"decode aStringArray, and apply the encoded command to aHand"

	aStringArray first = 'event' ifTrue: [
		^self applyEventMessage: aStringArray to: aHand
	].
	aStringArray first = 'viewExtent' ifTrue: [
		^self applyViewExtentMessage: aStringArray to: aHand
	].
	aStringArray first = 'beginBuffering' ifTrue: [
		^aHand convertRemoteClientToBuffered
	].

	^self error: 'unknown message type: ', aStringArray first
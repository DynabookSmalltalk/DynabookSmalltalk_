as yet unclassified
sendDeltas
"
NebraskaDebug showStats: #sendDeltas
"
	| t deltas dirtyFraction |

	previousVersion ifNil: [
		previousVersion := Display deepCopy.
		remote 
			image: previousVersion 
			at: 0@0 
			sourceRect: previousVersion boundingBox 
			rule: Form paint.
		^remote forceToScreen: previousVersion boundingBox.
	].
	dirtyRect ifNil: [^self].
	t := Time millisecondClockValue.
	dirtyFraction := dirtyRect area / previousVersion boundingBox area roundTo: 0.0001.

	deltas := mirrorOfScreen deltaFrom: (previousVersion copy: dirtyRect) at: dirtyRect origin.
	previousVersion := mirrorOfScreen.
	mirrorOfScreen := nil.

	remote 
		image: deltas at: dirtyRect origin sourceRect: deltas boundingBox rule: Form reverse;
		forceToScreen: dirtyRect.

	t := Time millisecondClockValue - t.
	NebraskaDebug at: #sendDeltas add: {t. dirtyFraction. deltas boundingBox}.
	dirtyRect := nil.

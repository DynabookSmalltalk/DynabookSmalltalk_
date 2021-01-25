Nebraska/embeddedWorlds
transform2By: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize

	(aDisplayTransform isPureTranslation) ifTrue: [
		^self 
			transformBy: aDisplayTransform 
			clippingTo: aClipRect 
			during: aBlock 
			smoothing: cellSize
	].
	^super 
		transform2By: aDisplayTransform 
		clippingTo: aClipRect 
		during: aBlock 
		smoothing: cellSize

drawing
image: aFormOrNil at: aPoint sourceRect: sourceRect rule: rule cacheID: cacheID newToCache: newToCache

	| t destRect d2 |

	destRect := aPoint extent: sourceRect extent.
	d2 := (lastTransform invertBoundsRect: destRect) expandBy: 1.
	(d2 intersects: lastClipRect) ifFalse: [
		^NebraskaDebug at: #bigImageSkipped add: {lastClipRect. d2}.
	].
	t := Time millisecondsToRun: [
		self sendCommand: {
			String with: CanvasEncoder codeImage.
			self class encodeImage: aFormOrNil.
			self class encodePoint: aPoint.
			self class encodeRectangle: sourceRect.
			self class encodeInteger: rule.
			self class encodeInteger: cacheID.
			self class encodeInteger: (newToCache ifTrue: [1] ifFalse: [0]).
		}.
	].
	(aFormOrNil notNil and: [aFormOrNil boundingBox area > 10000]) ifTrue: [
		NebraskaDebug 
			at: #bigImage 
			add: {lastClipRect. aPoint. sourceRect extent. t. cacheID. newToCache}.
	].


stepping
updateContentsFrom: aValue
	self growable
		ifTrue:
			[self contentsFitted: aValue]
		ifFalse:
			[self contentsClipped: aValue]
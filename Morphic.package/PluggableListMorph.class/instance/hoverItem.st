accessing - items
hoverItem

	^ self hoverRow = 0
		ifTrue: [nil]
		ifFalse: [self itemAt: self hoverRow]
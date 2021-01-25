private-accessing
environmentAt: anItemKind put: anItem

	self itemKind = anItemKind
		ifTrue: [item := anItem]
		ifFalse: [environment at: anItemKind put: anItem].
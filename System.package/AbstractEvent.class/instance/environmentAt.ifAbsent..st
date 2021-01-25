private-accessing
environmentAt: anItemKind ifAbsent: aBlock

	^ self itemKind = anItemKind
		ifTrue: [self item]
		ifFalse: [environment at: anItemKind ifAbsent: aBlock]
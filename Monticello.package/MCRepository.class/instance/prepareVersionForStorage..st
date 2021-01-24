accessing
prepareVersionForStorage: aVersion
	^ self alwaysStoreDiffs
		ifTrue: [aVersion asDiffAgainst:
				 (self withCache closestAncestorVersionFor: aVersion info ifNone: [^ aVersion])]
		ifFalse: [aVersion]
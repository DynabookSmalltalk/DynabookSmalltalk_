building
add: anItem
	| requirements |
	(anItem wantsToBeOutermost)
		ifTrue: [^self addDeferred: anItem].
	requirements := self unresolvedRequirementsFor: anItem.
	requirements isEmpty
		ifTrue: [self addToOrder: anItem]
		ifFalse: [self addRequirements: requirements for: anItem].
	^anItem
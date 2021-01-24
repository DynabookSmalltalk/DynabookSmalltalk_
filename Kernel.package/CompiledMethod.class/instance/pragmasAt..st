accessing-pragmas & properties
pragmasAt: aSelector
	^self pragmas select: [:p| p keyword = aSelector]
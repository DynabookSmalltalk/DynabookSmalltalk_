accessing - selectors
highlightSelector: aSelector

	self highlightSelector = aSelector ifTrue: [^ self].
	self setProperty: #highlightSelector toValue: aSelector.
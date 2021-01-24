selecting
classSelection: aNumber
	classSelection := aNumber = 0 ifFalse: [self visibleClasses at: aNumber].
	self protocolSelection: 0.
	self changed: #classSelection;  changed: #protocolList.
	(self protocolList size = 1
	 and: [self protocolList first first = $*])
		ifTrue:
			[self protocolSelection: 1]
		ifFalse:
			[self changed: #annotations;
				changed: #methodList]

listing
classList
	^ categorySelection = self extensionsCategory
		ifTrue: [self labeledClassnames: self visibleClasses]
		ifFalse: [self visibleClasses]
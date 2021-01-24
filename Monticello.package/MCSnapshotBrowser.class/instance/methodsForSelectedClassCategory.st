accessing
methodsForSelectedClassCategory
	^ items select:
		[ : ea | (self visibleClasses includes: ea className) and: [ ea isMethodDefinition ] ]
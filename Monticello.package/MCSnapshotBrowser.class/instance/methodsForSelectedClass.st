accessing
methodsForSelectedClass
	^ items select:
		[ : ea | ea className = classSelection and: [ ea isMethodDefinition ] ]
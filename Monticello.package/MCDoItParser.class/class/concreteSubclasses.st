accessing class hierarchy
concreteSubclasses
	^ self allSubclasses reject: [:c | c isAbstract]
testing
concreteSubclassesDo: aBlock

	self allSubclassesDo: [ :each |
		each isAbstract ifFalse: [ aBlock value: each ] ]
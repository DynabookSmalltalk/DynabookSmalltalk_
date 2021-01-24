testing
readerClassForFileNamed: fileName
	
	self concreteSubclassesDo: [ :each |
		(each canReadFileNamed: fileName) ifTrue: [ ^each ] ].
	^nil
enumerating
withAllSuperclassesDo: aBlock

	self realClass ifNotNil: [ :realClass | ^realClass withAllSuperclassesDo: aBlock ].
	^aBlock value: self
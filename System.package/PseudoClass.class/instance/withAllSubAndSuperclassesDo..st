enumerating
withAllSubAndSuperclassesDo: aBlock

	self realClass ifNotNil: [ :realClass | ^realClass withAllSubAndSuperclassesDo: aBlock ].
	^aBlock value: self
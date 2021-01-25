accessing
classVarNames

	self realClass ifNotNil: [ :realClass | ^realClass classVarNames ].
	^#()
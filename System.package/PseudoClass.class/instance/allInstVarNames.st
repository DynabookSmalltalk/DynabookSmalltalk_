accessing
allInstVarNames

	self realClass ifNotNil: [ :realClass | ^realClass allInstVarNames ].
	^#()
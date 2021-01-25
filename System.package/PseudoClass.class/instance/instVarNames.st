accessing
instVarNames

	self realClass ifNotNil: [ :realClass | ^realClass instVarNames ].
	^#()
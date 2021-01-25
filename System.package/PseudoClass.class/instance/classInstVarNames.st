accessing
classInstVarNames

	self realClass ifNotNil: [ :realClass | ^realClass instVarNames ].
	^#()
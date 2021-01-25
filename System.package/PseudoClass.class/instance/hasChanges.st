testing
hasChanges

	self sourceCode isEmpty ifFalse:[^true].
	self organization hasNoComment ifFalse:[^true].
	definition ifNotNil: [ ^true].
	metaClass ifNotNil: [ ^metaClass hasChanges].
	^false
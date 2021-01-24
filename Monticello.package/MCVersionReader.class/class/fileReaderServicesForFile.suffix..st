file services
fileReaderServicesForFile: fullName suffix: suffix
	self isAbstract ifTrue: [^ Array empty].
	^ ((suffix = self extension) or: [ suffix = '*' ])
		ifTrue: [self services]
		ifFalse: [Array empty]
		
file i/o
audioDirectory

	(FileDirectory default directoryExists: 'audio')
		ifFalse: [FileDirectory default createDirectory: 'audio'].
	^FileDirectory default directoryNamed: 'audio'
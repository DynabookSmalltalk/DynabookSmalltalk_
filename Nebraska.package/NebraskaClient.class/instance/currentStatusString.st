as yet unclassified
currentStatusString

	(connection isNil or: [connection isConnected not]) ifTrue: [^'nada'].
	^connection remoteSocketAddress hostNumber,
		' - ',
		(self backlog // 1024) printString,'k'
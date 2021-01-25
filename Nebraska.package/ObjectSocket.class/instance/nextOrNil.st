stream protocol
nextOrNil
	inObjects isEmpty
		ifTrue: [ ^nil ]
		ifFalse: [ ^inObjects removeFirst ]
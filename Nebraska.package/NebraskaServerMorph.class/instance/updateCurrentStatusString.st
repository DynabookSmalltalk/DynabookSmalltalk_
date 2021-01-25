drawing
updateCurrentStatusString

	self server ifNil:[
		currentStatusString := '<Nebraska not active>' translated.
		currentBacklogString := ''.
	] ifNotNil:[
		currentStatusString := 
			' Nebraska: {1} clients' translated format: {self server numClients printString}.
		currentBacklogString := 'backlog: ' translated,
				((previousBacklog := self server backlog) // 1024) printString,'k'
	].

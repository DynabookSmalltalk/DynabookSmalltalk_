sending
sendSomeData: arrayOfByteObjects to: anIPAddress for: aCommunicatorMorph multiple: aBoolean

	Socket initializeNetwork.
	socket := Socket newTCP.
	dataQueue := SharedQueue new.
	dataQueue nextPut: arrayOfByteObjects.
	communicatorMorph := aCommunicatorMorph.
	ipAddress := anIPAddress.
	process := [
		self doConnectForSend ifTrue: [
			[self doSendData] whileTrue.
			communicatorMorph commResult: {#message -> 'OK'}.
			socket closeAndDestroy.
		].
	] newProcess.
	process priority: Processor highIOPriority.
	process resume.
	^dataQueue

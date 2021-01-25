receiving
receiveDataOn: aSocket for: aCommunicatorMorph

	socket := aSocket.
	remoteSocketAddress := socket remoteSocketAddress hostNumber.
	communicatorMorph := aCommunicatorMorph.
	process := [
		leftOverData := ''.
		[self doReceiveData] whileTrue.
		socket closeAndDestroy.
	] newProcess.
	process priority: Processor highIOPriority.
	process resume.

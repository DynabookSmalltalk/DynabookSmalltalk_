sending
sendSomeData: arrayOfByteObjects to: anIPAddress for: aCommunicatorMorph

	dataQueue := self 
		sendSomeData: arrayOfByteObjects 
		to: anIPAddress 
		for: aCommunicatorMorph 
		multiple: false.
	dataQueue nextPut: nil.		"only this message to send"

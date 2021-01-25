handlers
handleNewStatusReplyFrom: dataStream sentBy: senderName ipAddress: ipAddressString

	(NebraskaGateKeeperMorph entryForIPAddress: ipAddressString) statusReplyReceived: (
		self newObjectFromStream: dataStream
	)

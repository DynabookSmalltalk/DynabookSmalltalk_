as yet unclassified
statusReplyReceived: anArray

	self setProperty: #lastStatusReplyTime toValue: Time totalSeconds.
	self setProperty: #lastStatusReply toValue: anArray.
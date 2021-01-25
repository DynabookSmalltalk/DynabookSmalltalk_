as yet unclassified
remoteAddress

	self isConnected ifFalse: [^nil].
	^socket remoteAddress
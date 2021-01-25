as yet unclassified
sendStatusCheck

	| null |
	null := String with: 0 asCharacter.
	NebraskaPeerToPeer new 
		sendSomeData: {
			NebraskaIncomingMessage typeStatusRequest,null. 
			Preferences defaultAuthorName,null.
		}
		to: self ipAddress
		for: self.

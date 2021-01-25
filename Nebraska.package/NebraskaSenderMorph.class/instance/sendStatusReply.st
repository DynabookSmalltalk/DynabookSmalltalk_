as yet unclassified
sendStatusReply

	| null |
	null := String with: 0 asCharacter.
	NebraskaPeerToPeer new 
		sendSomeData: {
			NebraskaIncomingMessage typeStatusReply,null. 
			Preferences defaultAuthorName,null.
			((NebraskaGateKeeperMorph acceptableTypesFor: self ipAddress) 
				eToyStreamedRepresentationNotifying: self).
		}
		to: self ipAddress
		for: self.

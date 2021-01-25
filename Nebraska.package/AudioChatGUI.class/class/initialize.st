class initialization
initialize

	NebraskaIncomingMessage
		forType: NebraskaIncomingMessage typeAudioChat 
		send: #handleNewAudioChatFrom:sentBy:ipAddress: 
		to: self.

	NebraskaIncomingMessage
		forType: NebraskaIncomingMessage typeAudioChatContinuous
		send: #handleNewAudioChat2From:sentBy:ipAddress: 
		to: self.



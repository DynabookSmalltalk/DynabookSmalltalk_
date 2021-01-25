as yet unclassified
initializeMessageHandlers

	self
		forType: self typeMorph 
		send: #handleNewMorphFrom:sentBy:ipAddress: 
		to: self;

		forType: self typeFridge 
		send: #handleNewFridgeMorphFrom:sentBy:ipAddress: 
		to: self;

		forType: self typeKeyboardChat 
		send: #handleNewChatFrom:sentBy:ipAddress: 
		to: self;

		forType: self typeMultiChat 
		send: #handleNewMultiChatFrom:sentBy:ipAddress: 
		to: self;

		forType: self typeStatusRequest 
		send: #handleNewStatusRequestFrom:sentBy:ipAddress: 
		to: self;

		forType: self typeStatusReply 
		send: #handleNewStatusReplyFrom:sentBy:ipAddress: 
		to: self;

		forType: self typeSeeDesktop 
		send: #handleNewSeeDesktopFrom:sentBy:ipAddress: 
		to: self.



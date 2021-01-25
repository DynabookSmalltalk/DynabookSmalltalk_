as yet unclassified
confirmListening

	self isListening ifFalse: [
		(self confirm: 'You currently are not listening and will not hear a reply.
Shall I start listening for you?' translated) ifTrue: [
			self startListening
		].
	].

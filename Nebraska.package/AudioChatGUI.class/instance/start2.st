initialization
start2

	Socket initializeNetwork.
	myrecorder initialize.

	self addARow: {
		self inAColumn: {
			(
				self inARow: {
					self inAColumn: {self toggleForSendWhileTalking}.
					self inAColumn: {self toggleForHandsFreeTalking}.
					self inAColumn: {self toggleForPlayOnArrival}.
				}
			) hResizing: #shrinkWrap.
			self inARow: {
				self talkBacklogIndicator.
				self messageWaitingAlertIndicator.
			}.
		}.
		self inAColumn: {
			theConnectButton := self connectButton.
			self playButton.
			theTalkButton := self talkButton.
		}.
	}.

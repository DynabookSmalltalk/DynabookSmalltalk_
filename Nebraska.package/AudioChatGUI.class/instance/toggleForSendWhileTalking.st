initialization
toggleForSendWhileTalking

	^self
		simpleToggleButtonFor: self 
		attribute: #transmitWhileRecording 
		help: 'Whether you want to send messages while recording.'
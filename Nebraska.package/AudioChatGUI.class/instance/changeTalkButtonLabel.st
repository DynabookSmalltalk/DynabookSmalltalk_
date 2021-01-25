stuff
changeTalkButtonLabel
	| bText |
	self transmitWhileRecording.
	handsFreeTalking 
		ifTrue: 
			[theTalkButton
				labelUp: 'Talk';
				labelDown: 'Release';
				label: 'Talk'.
			bText := 'Click once to begin a message. Click again to end the message.']
		ifFalse: 
			[theTalkButton
				labelUp: 'Talk';
				labelDown: (transmitWhileRecording 
							ifTrue: ['TALKING']
							ifFalse: ['RECORDING']);
				label: 'Talk'.
			bText := 'Press and hold to record a message.'].
	bText := transmitWhileRecording 
		ifTrue: [bText , ' The message will be sent while you are speaking.']
		ifFalse: [bText , ' The message will be sent when you are finished.'].
	theTalkButton setBalloonText: bText
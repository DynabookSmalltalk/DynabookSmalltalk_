initialization
messageWaitingAlertIndicator

	| messageCounter |
	myalert := AlertMorph new socketOwner: self.
	messageCounter := UpdatingStringMorph on: self selector: #objectsInQueue.
	myalert addMorph: messageCounter.
	messageCounter contents: '0'; color: Color white.
	messageCounter align: messageCounter center with: myalert center.
	myalert setBalloonText: 'New messages indicator. This will flash and show the number of messages when there are messages that you haven''t listened to. You can click here to play the next message.'.

	myalert on: #mouseUp send: #playNextMessage to: self.
	^myalert
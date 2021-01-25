handlers
handleNewChatFrom: dataStream sentBy: senderName ipAddress: ipAddressString

	^ NebraskaChatMorph 
		chatFrom: ipAddressString 
		name: senderName 
		text: (self newObjectFromStream: dataStream).
	
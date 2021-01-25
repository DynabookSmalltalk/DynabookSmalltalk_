handlers
handleNewMultiChatFrom: dataStream sentBy: senderName ipAddress: ipAddressString

	^ NebraskaMultiChatMorph 
		chatFrom: ipAddressString 
		name: senderName 
		text: (self newObjectFromStream: dataStream).
	
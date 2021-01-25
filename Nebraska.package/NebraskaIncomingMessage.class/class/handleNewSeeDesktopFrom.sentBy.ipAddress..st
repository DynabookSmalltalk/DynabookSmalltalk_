handlers
handleNewSeeDesktopFrom: dataStream sentBy: senderName ipAddress: ipAddressString

	"more later"

	^ NebraskaChatMorph 
		chatFrom: ipAddressString 
		name: senderName 
		text: ipAddressString,' would like to see your desktop' translated.
	
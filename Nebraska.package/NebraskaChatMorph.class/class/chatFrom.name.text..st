as yet unclassified
chatFrom: ipAddress name: senderName text: text

	| chatWindow |

	chatWindow := self 
		chatWindowForIP: ipAddress 
		name: senderName 
		picture: (NebraskaSenderMorph pictureForIPAddress: ipAddress) 
		inWorld: self currentWorld.
	chatWindow
		chatFrom: ipAddress 
		name: senderName 
		text: text

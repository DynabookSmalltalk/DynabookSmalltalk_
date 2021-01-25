as yet unclassified
acceptRequest: requestType from: senderName at: ipAddressString

	| entry |

	UpdateCounter := self updateCounter + 1.
	entry := self entryForIPAddress: ipAddressString.
	senderName isEmpty ifFalse: [entry latestUserName: senderName].
	^entry requestAccessOfType: requestType
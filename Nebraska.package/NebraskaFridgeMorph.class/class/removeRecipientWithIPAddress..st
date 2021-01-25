as yet unclassified
removeRecipientWithIPAddress: ipString

	FridgeRecipients := self fridgeRecipients reject: [ :each |
		ipString = each ipAddress
	].
	UpdateCounter := self updateCounter + 1

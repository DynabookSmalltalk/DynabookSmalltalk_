as yet unclassified
chatFrom: ipAddress name: senderName text: textPackage

	super chatFrom: ipAddress name: senderName text: textPackage second.
	self updateIPAddressField: (
		targetIPAddresses,textPackage first,{ipAddress} 
			copyWithout: NetNameResolver localAddressString
	).

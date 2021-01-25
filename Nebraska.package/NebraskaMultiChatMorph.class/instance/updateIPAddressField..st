as yet unclassified
updateIPAddressField: newAddresses
	
	targetIPAddresses := (
		newAddresses copyWithout: NetNameResolver localAddressString
	) asSet asArray sort.

	(fields at: #ipAddress) contents: targetIPAddresses size printString,' people'.
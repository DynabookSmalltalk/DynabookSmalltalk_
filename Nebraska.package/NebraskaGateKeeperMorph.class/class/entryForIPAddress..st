as yet unclassified
entryForIPAddress: ipAddressString

	| known entry |

	UpdateCounter := self updateCounter + 1.
	known := self knownIPAddresses.
	entry := known at: ipAddressString ifAbsentPut: [
		entry := NebraskaGateKeeperEntry new.
		entry ipAddress: ipAddressString.
		entry
	].
	^entry
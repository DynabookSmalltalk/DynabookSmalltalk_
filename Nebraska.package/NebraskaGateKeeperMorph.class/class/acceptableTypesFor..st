as yet unclassified
acceptableTypesFor: ipAddressString

	^(self knownIPAddresses at: ipAddressString ifAbsent: [^#()]) acceptableTypes
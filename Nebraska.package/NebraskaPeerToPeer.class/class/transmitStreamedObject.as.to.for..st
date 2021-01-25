as yet unclassified
transmitStreamedObject: outData as: objectCategory to: anIPAddress for: aCommunicator

	| null |
	null := String with: 0 asCharacter.
	self new 
		sendSomeData: {
			objectCategory,null. 
			Preferences defaultAuthorName,null.
			outData
		}
		to: anIPAddress
		for: aCommunicator


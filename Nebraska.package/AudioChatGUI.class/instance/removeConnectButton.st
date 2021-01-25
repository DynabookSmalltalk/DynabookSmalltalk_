stuff
removeConnectButton

	theConnectButton ifNotNil: [
		theConnectButton delete.
		theConnectButton := nil.
	].
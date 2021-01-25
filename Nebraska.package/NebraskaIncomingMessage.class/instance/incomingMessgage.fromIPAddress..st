as yet unclassified
incomingMessgage: dataStream fromIPAddress: ipAddress

	| nullChar messageType senderName  selectorAndReceiver |

	nullChar := 0 asCharacter.
	messageType := dataStream upTo: nullChar.
	senderName := dataStream upTo: nullChar.
	(NebraskaGateKeeperMorph acceptRequest: messageType from: senderName at: ipAddress) ifFalse: [
		^self
	].
	selectorAndReceiver := self class messageHandlers at: messageType ifAbsent: [^self].
	^selectorAndReceiver second 
		perform: selectorAndReceiver first 
		withArguments: {dataStream. senderName. ipAddress}


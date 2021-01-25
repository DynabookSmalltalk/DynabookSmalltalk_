sending
doConnectForSend

	| addr port |

	addr := NetNameResolver addressForName: (ipAddress copyUpTo: $:).
	addr ifNil: [
		communicatorMorph commResult: {#message -> ('could not find ',ipAddress)}.
		^false].

	port := (ipAddress copyAfter: $:) asInteger.
	port ifNil: [port := self class eToyCommunicationsPorts first].

	socket connectNonBlockingTo: addr port: port.
	[socket waitForConnectionFor: 15]
		on: ConnectionTimedOut
		do: [:ex |
			communicatorMorph commResult: {#message -> ('no connection to ',ipAddress,' (',
				ipAddress,')')}.
			^false].
	^true


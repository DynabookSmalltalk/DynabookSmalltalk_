connection - client - sockets
addressAndPort: brokerIDString 
	"parses brokerIDString and get address and port"
	| colonPos serverAddress serverPort |
	colonPos _ brokerIDString findString: ':'.
	colonPos isZero
		ifTrue: [""
			serverAddress _ brokerIDString.
			serverPort _ '9999']
		ifFalse: [""
			serverAddress _ brokerIDString first: colonPos - 1.
			serverPort _ brokerIDString allButFirst: colonPos].
	^ {NetNameResolver addressForName: serverAddress. serverPort asInteger}
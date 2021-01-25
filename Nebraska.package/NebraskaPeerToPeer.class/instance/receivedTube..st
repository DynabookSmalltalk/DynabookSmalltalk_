receiving
receivedTube: aString
	"Sender offers a tube for talking back. Get the tube's address."
	| addr |
	addr := (Smalltalk classNamed: 'SugarLauncher')
					ifNotNil: [:l | l current socketAddressForTube: aString].
	addr ifNotNil: [remoteSocketAddress := addr]
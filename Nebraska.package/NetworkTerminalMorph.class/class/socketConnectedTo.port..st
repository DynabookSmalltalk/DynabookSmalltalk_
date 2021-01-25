instance creation
socketConnectedTo: serverHost  port: serverPort

	| sock |

	Socket initializeNetwork.
	sock := Socket new.
	[sock connectTo: (NetNameResolver addressForName: serverHost) port: serverPort]
		on: ConnectionTimedOut
		do: [:ex | self error: 'could not connect to server' translated ].
	^StringSocket on: sock


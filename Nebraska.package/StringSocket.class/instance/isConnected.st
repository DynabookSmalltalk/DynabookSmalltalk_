private-IO
isConnected

	^super isConnected and: [socketWriterProcess notNil]
objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	cachingEnabled ifNil: [cachingEnabled := true].
	^super convertToCurrentVersion: varDict refStream: smartRefStrm.

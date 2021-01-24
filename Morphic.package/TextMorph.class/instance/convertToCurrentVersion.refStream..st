objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	
	self borderWidth ifNil: [
		self borderWidth: 0.
		self removeProperty: #fillStyle].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm.


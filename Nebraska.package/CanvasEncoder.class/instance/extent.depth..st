drawing
extent: newExtent  depth: newDepth
	self sendCommand: {
		self class codeExtentDepth asString.
		self class encodePoint: newExtent. 
		self class encodeInteger: newDepth.
	}
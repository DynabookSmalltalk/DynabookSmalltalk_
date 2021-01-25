decoding
releaseImage: command 
	| cacheID |
	CachedForms ifNil: [^self].
	cacheID := self class decodeInteger: (command second).
	CachedForms at: cacheID put: nil
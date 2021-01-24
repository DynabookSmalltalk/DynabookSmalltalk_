private-encoding
encodeChar: aChar to: aStream

	aChar = Character space
		ifTrue: [^ aStream nextPut: $_].
	^ super encodeChar: aChar to: aStream
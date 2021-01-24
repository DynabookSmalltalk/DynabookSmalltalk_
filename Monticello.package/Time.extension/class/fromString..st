*monticello
fromString: aString
	^ self readFrom: (ReadStream on: aString).

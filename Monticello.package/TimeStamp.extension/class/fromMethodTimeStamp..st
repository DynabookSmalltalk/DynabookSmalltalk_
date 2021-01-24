*monticello-instance creation
fromMethodTimeStamp: aString
	| stream |
	stream := ReadStream on: aString.
	stream skipSeparators.
	stream skipTo: Character space.
	^self readFrom: stream.
*monticello-instance creation
fromString: aString
	"Answer a new instance for the value given by aString.

	 TimeStamp fromString: '1-10-2000 11:55:00 am'. 
	"

	^self readFrom: (ReadStream on: aString).
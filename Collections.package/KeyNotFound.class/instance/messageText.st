accessing
messageText
	"Return a textual description of the exception."
	^messageText ifNil:['Key not found: ', key]
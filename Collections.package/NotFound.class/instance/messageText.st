accessing
messageText
	"Return a textual description of the exception."
	^messageText ifNil:['Object is not in the collection.']
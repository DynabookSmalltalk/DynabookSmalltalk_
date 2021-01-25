remembering & forgetting
rememberForEver: anObject naming: nameObject 
	"remember anObject for ever"
	^ self
		remember: anObject
		forSeconds: nil
		naming: nameObject
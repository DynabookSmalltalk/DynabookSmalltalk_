instance creation
source: aString environment: anEnvironment requestor: aRequestor
	^ self 
		source: aString
		context: nil
		receiver: nil
		class: UndefinedObject
		environment: anEnvironment
		requestor: aRequestor
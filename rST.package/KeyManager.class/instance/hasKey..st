accessing
hasKey: anObject 
	"answer if anObject has a key"
	anObject isNil
		ifTrue: [^ self error: 'can store a nil'].

	mutex
		critical: [dictionary
				keyAtIdentityValue: anObject
				ifAbsent: [^ false]].
	^ true
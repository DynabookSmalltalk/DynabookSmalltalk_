accessing
keyFor: anObject 
	"gives a key for anObject, the key will be the same in future calls"
	| key |
	anObject isNil
		ifTrue: [^ self error: 'can store a nil'].
	mutex
		critical: [key _ dictionary
						keyAtIdentityValue: anObject
						ifAbsent: [self newKeyFor: anObject]].
	^ key
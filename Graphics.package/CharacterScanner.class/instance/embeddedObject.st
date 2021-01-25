stop conditions
embeddedObject

	pendingKernX := 0.
	((text attributesAt: lastIndex) reject: [:each | each anchoredMorph isNil])
		ifNotEmpty: [:attributes | (self placeEmbeddedObjectsFrom: attributes) ifTrue: [^ true]].
	self setFont.
 
	"Note: if ever several objects are embedded on same character, only indent lastIndex once"
	lastIndex := lastIndex + 1.
	^false
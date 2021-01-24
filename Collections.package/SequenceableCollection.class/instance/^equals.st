comparing
= otherCollection 
	"Answer true if the receiver is equivalent to the otherCollection.
	First test for identity, then rule out different class and sizes of
	collections. As a last resort, examine each element of the receiver
	and the otherCollection."

	self == otherCollection ifTrue: [^ true].
	self class = otherCollection class ifFalse: [^ false].
	^ self hasEqualElements: otherCollection
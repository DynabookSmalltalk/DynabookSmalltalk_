objects from disk
bytesPerBasicElement
	"Answer the number of bytes that each of my basic elements requires.
	In other words:
		self basicSize * self bytesPerBasicElement
	should equal the space required on disk by my variable sized representation."
	| bytesPerElementOrZero |
	bytesPerElementOrZero := #[0 0 0 0 0 0 0 0 8 4 4 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1] at: self class instSpec.
	^bytesPerElementOrZero = 0
		ifTrue: [Smalltalk wordSize]
		ifFalse: [bytesPerElementOrZero]
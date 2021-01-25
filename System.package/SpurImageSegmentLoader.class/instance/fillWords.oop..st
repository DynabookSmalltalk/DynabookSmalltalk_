reading
fillWords: object oop: oop
	| size |
	size := object basicSize.
	(size = 2 and: [object isFloat])
		ifTrue: "boxed floats are in platform order internally (hence in platform order in the segment) but in big-endian order externally"
			[object
				basicAt: 2 put: self readUint32;
				basicAt: 1 put: self readUint32]
		ifFalse:
			[1 to: object basicSize do:
				[:i |
				 object basicAt: i put: self readUint32]].
	^object
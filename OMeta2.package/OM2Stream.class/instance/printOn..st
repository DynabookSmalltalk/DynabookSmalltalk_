printing
printOn: aStream

	| inputIsString curr |
	inputIsString := (self inputSpecies inheritsFrom: String) and: [(self inputSpecies inheritsFrom: Symbol) not].
	curr := self.
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name;
		nextPut: $(.
	[curr notNil] whileTrue: [
		(curr isKindOf: OM2EndOfStream) ifTrue: [
			aStream nextPut: $).
			^ self
		].
		inputIsString
			ifTrue: [aStream nextPut: curr head]
			ifFalse: [
				curr head printOn: aStream.
				aStream space
			].
		curr := curr basicTail.
	].
	aStream nextPutAll: '...)'
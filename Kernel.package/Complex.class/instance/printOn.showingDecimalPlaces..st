printing
printOn: aStream showingDecimalPlaces: placesDesired
	real printOn: aStream showingDecimalPlaces: placesDesired.
	aStream nextPut: Character space.
	imaginary signBit = 0
		ifTrue: [aStream nextPut: $+]
		ifFalse: [aStream nextPut: $-].
	aStream nextPut: Character space.
	imaginary abs printOn: aStream showingDecimalPlaces: placesDesired.
	aStream nextPut: Character space.
	aStream nextPut: $i

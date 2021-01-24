conversion
conversionNeededFor: aCharacter

	^ ((aCharacter asciiValue between: 32 and: 127) not and: [aCharacter asciiValue ~= 9])
		or: [self reservedCharacters includes: aCharacter]
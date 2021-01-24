model access
basicKeyPressed: aCharacter
	"Maps [space] key to be a special key."
	
	aCharacter = Character space
		ifTrue: [self specialKeyPressed: aCharacter asciiValue]
		ifFalse: [super basicKeyPressed: aCharacter].
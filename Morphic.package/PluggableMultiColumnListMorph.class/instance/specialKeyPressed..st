filtering
specialKeyPressed: asciiValue
	"Use the [Tab] key to filter specific columns."
	
	^ asciiValue = Character tab asciiValue
		ifTrue: [self highlightNextColumn]
		ifFalse: [super specialKeyPressed: asciiValue].
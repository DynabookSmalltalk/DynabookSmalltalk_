comparing
= aSymbol
	"Compare the receiver and aSymbol." 
	self == aSymbol ifTrue: [^ true].
	aSymbol isSymbol ifTrue: [^ false].
	"Use String comparison otherwise"
	^ super = aSymbol
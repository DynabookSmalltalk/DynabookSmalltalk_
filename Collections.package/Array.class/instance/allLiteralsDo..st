literals
allLiteralsDo: aBlock

	"I am a literal."
	aBlock value: self.
	
	"All my elements are literals."
	self do: [:each | each allLiteralsDo: aBlock].
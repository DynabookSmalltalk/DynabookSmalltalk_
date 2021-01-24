literals
literals
	
	^ Array streamContents: [:result |
		self literalsDo: [:lit | result nextPut: lit]]
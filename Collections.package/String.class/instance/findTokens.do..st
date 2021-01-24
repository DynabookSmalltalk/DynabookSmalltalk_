accessing - tokens
findTokens: delimiters do: aBlock
	
	self
		findTokens: delimiters
		indicesDo: [:start :end | aBlock value: (self copyFrom: start to: end)].
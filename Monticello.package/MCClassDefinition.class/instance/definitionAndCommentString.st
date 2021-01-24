printing
definitionAndCommentString
	^ String streamContents: [:stream |
		self printDefinitionOn: stream.
		stream cr; cr.
		self printClassSideDefinitionOn: stream.    
		stream cr; cr.
		self printCommentOn: stream]
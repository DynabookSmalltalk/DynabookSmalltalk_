accessing
findTokens: delimiters
	"Answer the collection of tokens between delimiters, which results from parsing self."
	
	| tokens |
	tokens := OrderedCollection new.
	self
		findTokens: delimiters
		do: [:token | tokens addLast: token].
	^ tokens
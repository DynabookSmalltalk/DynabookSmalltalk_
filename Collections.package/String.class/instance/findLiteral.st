converting
findLiteral
	"Scan the receiver for tokens that represent Smalltalk code literals. Return the first token or nil if non were found."
	
	| tokens |
	tokens := Scanner new typedScanTokens: self.
	^tokens isEmpty ifFalse: [tokens first]
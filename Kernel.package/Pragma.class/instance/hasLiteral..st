literals
hasLiteral: aLiteral
	"Extra support for #hasLiteralTest:."
	
	^ (super hasLiteral: aLiteral)
		or: [keyword == #hasLiteralTest: and: [
			self methodClass theNonMetaClass perform: arguments first with: aLiteral]]
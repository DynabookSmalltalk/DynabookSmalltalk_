literals
literalEqual: otherLiteral
	"Answer true if the receiver and otherLiteral represent the same literal. 
	
	By default, all lookup keys (such as variable bindings) are literally equal only if identical. This is how variable sharing works, by preserving identity and changing only the value.
	
	Override if you want to be more flexible such as in class bindings."
	
	^ self == otherLiteral
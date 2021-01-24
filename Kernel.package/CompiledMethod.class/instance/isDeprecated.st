testing
isDeprecated
	"Note that #literalsDo: is faster than #hasLiteral: (and #hasLiteral:scanForSpecial:). We already know that 'self deprecated' should be the first statement in a deprecated method, which is directly accessible in this method's literals. No need to check compiled blocks or other nested structures. We expand the implementation of #literalsDo: here to gain twice the speed.
	
	Note that both #isQuick and is-this-method check make no sense performance-wise. Maybe bench again in the future."
	
	| literal |
	1 to: self numLiterals do: [:index |
		((literal := self literalAt: index) == #deprecated: or: [ literal == #deprecated ])
			ifTrue: [ ^true ] ].
	^ false
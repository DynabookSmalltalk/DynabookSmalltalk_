fileIn
fixCapitalizationOfSymbols
	"MultiString>>capitalized was not implemented 
correctly. 
	Fix eventual accessors and mutators here."
	| sym ms |
	1 to: outPointers size do:[:i|
		sym := outPointers at: i.
		(sym class == WideSymbol and:[sym size > 3]) ifTrue:[
			((sym beginsWith: 'get')
				and:[(sym at: 4) asInteger < 256
				and:[(sym at: 4) isLowercase]]) ifTrue:[
					ms := sym asString.
					ms at: 4 put: (ms at: 4) asUppercase.
					ms := ms asSymbol.
					sym becomeForward: ms.
			].
			((sym beginsWith: 'set')
				and:[(sym at: 4) asInteger < 256
				and:[(sym at: 4) isLowercase
				and:[sym last = $:
				and:[(sym occurrencesOf: $:) = 1]]]]) ifTrue:[
					ms := sym asString.
					ms at: 4 put: (ms at: 4) asUppercase.
					ms := ms asSymbol.
					sym becomeForward: ms.
				].
			outPointers at: i put: sym.
		].
	].
create
forMethodReference: aMethodReference
	| definition |
	definition := self cachedDefinitions at: aMethodReference compiledMethod ifAbsent: [].
	(definition isNil
		or: [definition selector ~= aMethodReference methodSymbol
		or: [definition className ~= aMethodReference classSymbol
		or: [definition classIsMeta ~= aMethodReference classIsMeta
		or: [definition category ~= aMethodReference category]]]])
			ifTrue: [definition := self 
						className: aMethodReference classSymbol
						classIsMeta: aMethodReference classIsMeta
						selector: aMethodReference methodSymbol
						category: aMethodReference category
						timeStamp: aMethodReference timeStamp
						source: aMethodReference source.
					self cachedDefinitions at: aMethodReference compiledMethod put: definition].
	^ definition
	
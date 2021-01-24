closure analysis
copyScopeAccessTo: aTempVar
	"For absorbHoistedTemp:, copy the receiver's reads and writes into the record in aTempVar."
	readingScopes ifNotNil:
		[readingScopes keysAndValuesDo:
			[:scopeBlock :reads|
			 reads do:
				[:location|
				 aTempVar addReadWithin: scopeBlock "<BlockNode>" at: location]]].
	writingScopes ifNotNil:
		[writingScopes keysAndValuesDo:
			[:scopeBlock :writes|
			 writes do:
				[:location|
				 aTempVar addWriteWithin: scopeBlock "<BlockNode>" at: location]]]
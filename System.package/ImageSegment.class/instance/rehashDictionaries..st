fileIn
rehashDictionaries: aCollection 
	ProgressInitiationException
		display: 'Rehash objects...'
		during: [:bar | 1
				to: aCollection size
				do: [:i | 
					(aCollection at: i) rehash.
					i \\ 10 = 0
						ifTrue: [bar value: i / aCollection size]]]
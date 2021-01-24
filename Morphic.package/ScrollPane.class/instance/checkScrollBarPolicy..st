layout
checkScrollBarPolicy: aSymbol

	aSymbol == #never ifTrue: [^ self].
	aSymbol == #whenNeeded ifTrue: [^ self].
	aSymbol == #always ifTrue: [^ self].
	
	Error signal: 'Invalid value for scrollbar policy. Use #never, #whenNeeded, or #always.'.
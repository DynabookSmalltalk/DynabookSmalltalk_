other
addName: aSymbol
	"private - associate a name to this color."
	
	| knownNames |
	[(self class respondsTo: aSymbol) and: [(self class perform: aSymbol) = self]] assert.
	knownNames := RGBToNames at: rgb ifAbsent: [#()].
	(knownNames includes: aSymbol)
		ifFalse: [ RGBToNames at: rgb put: (knownNames copyWith: aSymbol)]
converting
findSymbol
	"Return the currently selected symbol, or nil if none.  Spaces, tabs and returns are ignored. Note that we do never return the empty symbol."
	
	| aString |
	aString := self copyWithoutAll: CharacterSet separators.
	aString size = 0 ifTrue: [^ nil].
	^ Symbol lookup: aString
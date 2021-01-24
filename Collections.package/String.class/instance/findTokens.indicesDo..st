accessing - tokens
findTokens: oneOrMoreCharacters indicesDo: aBlock
	"Parse self to find tokens between delimiters. Any character in the Collection delimiters marks a border.  Several delimiters in a row are considered as just one separation. The interface is similar to #lineIndicesDo:."
	
	| keyStart keyStop separators size |
	size := self size.
	separators := oneOrMoreCharacters isCharacter 
		ifTrue: [{oneOrMoreCharacters}]
		ifFalse: [oneOrMoreCharacters].
	keyStop := 1.
	[keyStop <= size] whileTrue: [
		keyStart := self skipDelimiters: separators startingAt: keyStop.
		keyStop := self findDelimiters: separators startingAt: keyStart.
		keyStart < keyStop
			ifTrue: [aBlock value: keyStart value: keyStop - 1]].
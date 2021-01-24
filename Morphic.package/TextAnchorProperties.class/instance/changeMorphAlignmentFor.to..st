menu
changeMorphAlignmentFor: aMorph to: aSymbol

	self verticalAlignmentMorph: aSymbol.
	self updateOwnerOf: aMorph.
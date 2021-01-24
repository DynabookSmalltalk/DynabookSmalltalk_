code generation
resetLiteralStreamForFullBlock
	literalStream := WriteStream on: (Array new: 32).
	addedExtraLiterals := false.
	optimizedSelectors := Set new
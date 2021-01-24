code generation
resetForFullBlockGeneration
	literalStream := WriteStream on: (Array new: 8).
	addedExtraLiterals := false.
	optimizedSelectors := Set new
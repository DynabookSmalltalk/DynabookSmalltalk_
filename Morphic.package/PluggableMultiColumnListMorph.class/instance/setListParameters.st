initialization
setListParameters

	listMorphs ifEmpty: [^ super setListParameters].
	
	listMorphs do: [:lm | listMorph := lm. super setListParameters].
	listMorph := listMorphs first.
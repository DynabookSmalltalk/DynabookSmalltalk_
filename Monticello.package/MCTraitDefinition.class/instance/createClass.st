visiting
createClass
	^ClassDescription
		newTraitNamed: name
		uses: (Compiler evaluate: self traitCompositionString)
		category: category
		in: Environment current
		

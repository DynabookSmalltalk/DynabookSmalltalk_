macro transformations
transform: encoder
	<hasLiteralTest: #isMacroTransformer:>

	special = 0 ifTrue: [^false].
	(self perform: (MacroTransformers at: special) with: encoder)
		ifTrue: 
			[^true]
		ifFalse: 
			[special := 0. ^false]
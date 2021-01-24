code generation
sizeCodeForEffect: encoder
	<hasLiteralTest: #isMacroSizer:>

	special > 0 
		ifTrue:
			[encoder noteOptimizedSelector: originalSelector.
			^self perform: (MacroSizers at: special) with: encoder with: false].
	^super sizeCodeForEffect: encoder
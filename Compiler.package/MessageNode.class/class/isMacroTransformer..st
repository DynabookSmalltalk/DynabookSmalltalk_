browsing support
isMacroTransformer: aLiteral
	"Let our macro methods be found when browsing senders"
	^aLiteral isSymbol
		 and: [MacroTransformers includes: aLiteral]
browsing support
isMacroSizer: aLiteral
	"Let our macro methods be found when browsing senders"
	^aLiteral isSymbol
		 and: [MacroSizers includes: aLiteral]

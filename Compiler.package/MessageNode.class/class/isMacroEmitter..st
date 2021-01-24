browsing support
isMacroEmitter: aLiteral
	"Let our macro methods be found when browsing senders"
	^aLiteral isSymbol
		 and: [MacroEmitters includes: aLiteral]
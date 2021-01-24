browsing support
isMacroPrinter: aLiteral
	"Let our macro methods be found when browsing senders"
	^aLiteral isSymbol
		 and: [MacroPrinters includes: aLiteral]

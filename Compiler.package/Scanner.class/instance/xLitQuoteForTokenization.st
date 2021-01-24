multi-character scans
xLitQuoteForTokenization
	"Parse underscores as per the regular parser when following a # symbol, so that e.g. #_WIN32 is correctly tokenized."
	| index |
	index :=  typeTable identityIndexOf: #xUnderscoreForTokenization ifAbsent: [^self xLitQuote].
	typeTable at: index put: #xUnderscore.
	[self xLitQuote] ensure:
		[typeTable at: index put: #xUnderscoreForTokenization]
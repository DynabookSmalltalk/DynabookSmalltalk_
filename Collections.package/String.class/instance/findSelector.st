converting
findSelector
	"Dan's code for hunting down selectors with keyword parts; while this doesn't give a true parse, in most cases it does what we want, in where it doesn't, we're none the worse for it."
	| sel possibleParens |
	sel := self withBlanksTrimmed.
	(sel includes: $:)
		ifTrue:
			[sel := sel copyWithRegex: '''[^'']*''' matchesReplacedWith: '''a string'''.
			sel := sel copyWithRegex: '#[^\[\(\s\.$]*' matchesReplacedWith: '#aSymbol'.
			sel := sel copyWithRegex: '\$.' matchesReplacedWith: '$x'. "handle $( $[ and $:"
			sel := sel copyReplaceAll: ':' with: ': '.	"for the style (aa max:bb) with no space"
			sel := sel copyReplaceAll: '[:' with: '[ :'.    "for the style ([:a) with no space"  
			possibleParens := sel substrings.
			sel := self class streamContents:
				[:s | | level |
				level := 0.
				possibleParens do:
					[:token |
					(level = 0 and: [token endsWith: ':'])
						ifTrue: [s nextPutAll: token]
						ifFalse: [level := level
								+ (token occurrencesOf: $() - (token occurrencesOf: $))
								+ (token occurrencesOf: $[) - (token occurrencesOf: $])
								+ (token occurrencesOf: ${) - (token occurrencesOf: $})]]]]
		ifFalse:
			[sel := self substrings ifNotEmpty: [:tokens | tokens last]].
	sel ifEmpty: [^ nil].
	sel first = $# ifTrue:
		[sel := sel allButFirst.
		sel ifEmpty: [^ nil]].
	sel isOctetString ifTrue: [sel := sel asOctetString].
	^ Symbol lookup: sel
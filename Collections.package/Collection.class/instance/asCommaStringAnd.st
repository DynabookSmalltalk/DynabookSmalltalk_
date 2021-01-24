printing - obsolete
asCommaStringAnd
	"Return collection printed as 'a, b and c' "

	self flag: #deprecate.
	^String streamContents: [:s | self asStringOn: s delimiter: ', ' last: ' and ']
		
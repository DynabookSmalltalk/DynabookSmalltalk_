printing - obsolete
asCommaString
	"Return collection printed as 'a, b, c' "

	self flag: #deprecate.
	^ self asArray joinSeparatedBy: ', '
		
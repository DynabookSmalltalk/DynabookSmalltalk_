converting
condensedIntoOneLine
	"Return a copy of the receiver with all separators converted to spaces, and with no consecutive spaces.  A formatting tool."
	^ String streamContents:
		[ : stream | | prior |
		prior := $X.  "some non-separator"
		self do:
			[ : char | char isSeparator ifTrue: [ prior isSeparator ifFalse: [stream space]] ifFalse: [ stream nextPut: char ].
			prior := char ] ]
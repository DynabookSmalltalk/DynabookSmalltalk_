emphasis
makeSelectorBoldIn: aClass
	"For formatting Smalltalk source code, set the emphasis of that portion of 
	the receiver's string that parses as a message selector to be bold."

	| parser |
	string size = 0 ifTrue: [^self].
	(parser := aClass newParser) parseSelector: string.
	self makeBoldFrom: 1 to: (parser endOfLastToken min: string size)
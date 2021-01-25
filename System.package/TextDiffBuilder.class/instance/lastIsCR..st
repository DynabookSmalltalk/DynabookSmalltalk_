private
lastIsCR: linesArray
	| last |
	^linesArray notEmpty
	 and: [(last := linesArray last string) notEmpty
	 and: [last last = Character cr or: [last endsWith: String crlf]]]
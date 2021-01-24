accessing
versionNumber
	"The Integer version number identified by this filename."
	| v |
	v := (self versionName copyAfterLast: $-) copyAfter: $..
	^(v notEmpty and: [v first isDigit])
		ifTrue: [ v asInteger ]
	 	ifFalse: [ 0 ]
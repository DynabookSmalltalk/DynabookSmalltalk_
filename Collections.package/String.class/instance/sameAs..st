comparing
sameAs: aString 
	"Answer whether the receiver sorts equal to aString. The 
	collation sequence is ascii with case differences ignored."
	self == aString ifTrue: [ ^true ].
	^(self compare: aString caseSensitive: false) = 2
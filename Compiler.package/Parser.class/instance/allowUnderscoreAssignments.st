private
allowUnderscoreAssignments
	"Query class + preference"
	^ (encoder ifNotNil: [:e | 
		e == self 
			ifTrue: [nil]
			ifFalse: [e classEncoding allowUnderscoreAssignments]])
		ifNil: [super allowUnderscoreAssignments]
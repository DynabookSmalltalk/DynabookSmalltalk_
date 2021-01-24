primitives
findFirstInString: aString inSet: inclusionMap startingAt: start
	"Trivial, non-primitive version"
	
	| i stringSize ascii |
	inclusionMap size ~= 256 ifTrue: [ ^0 ].
	stringSize := aString size.
	i := start - 1.
	[ (i := i + 1) <= stringSize ] whileTrue: [
		(ascii := aString basicAt: i) < 256 ifTrue: [
			(inclusionMap at: ascii + 1) = 0 ifFalse: [ ^i ] ] ].
	^0
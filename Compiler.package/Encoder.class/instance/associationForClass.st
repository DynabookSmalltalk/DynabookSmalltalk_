results
associationForClass
	| assoc |
	assoc := self environment associationAt: cue getClass name ifAbsent: [nil].
	^assoc value == cue getClass
		ifTrue: [assoc]
		ifFalse: [Association new value: cue getClass]
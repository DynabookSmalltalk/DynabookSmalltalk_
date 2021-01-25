reading
mapOop: oop
	| i |
	(oop bitAnd: 1) = 0 ifTrue:	"pointer"
		[(i := oop >> 2) >= 16r20000000 ifTrue:
			[^outPointers at: i - 16r20000000].
		^oopMap at: oop].
	i := oop >> 1.	"signed small int"
	i <= 16r3FFFFFFF ifTrue: [^i].
	^i - 16r80000000
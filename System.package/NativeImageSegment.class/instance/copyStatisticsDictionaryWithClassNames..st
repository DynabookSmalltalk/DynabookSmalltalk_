statistics
copyStatisticsDictionaryWithClassNames: aDictionary
	| d |
	d := aDictionary copyEmpty.
	aDictionary keysAndValuesDo:
		[:classIndex :value|
		 d
			at: ((classIndex anyMask: 16r200000) "TopHashBit = 16r200000, => in out pointers"
					ifTrue: [(outPointers at: classIndex - 16r200000 + 1) name]
					ifFalse: ['InSegmentClass', classIndex asString])
			put: value].
	^d
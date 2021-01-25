reading
mapToSpurFormat: format
	| instSpec instSize |
	instSpec := format >> 7 bitAnd: 16r0F.
	instSize := (format >> 10 bitAnd: 16rC0) + (format >> 1 bitAnd: 16r3F) - 1.
	instSpec := instSpec <= 4
		ifTrue: [instSpec]	"no change"
		ifFalse: [instSpec = 6
			ifTrue: [10]	"WordArray was 6 now 10-11"
			ifFalse: [instSpec >= 12
				ifTrue: [instSpec + 12]	"CompiledMethods 12-15 now 24-31"
				ifFalse: [instSpec >= 8
					ifTrue: [instSpec + 8]	"CompiledMethods 8-11 now 16-23"	
					ifFalse: [self error: 'unexpected format']]]].
	^instSpec << 16 + instSize
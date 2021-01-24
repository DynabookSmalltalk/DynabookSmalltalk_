code generation
sizeCodeForRepeat: encoder value: forValue 
	"L1: ... Jmp(L1) nil (nil for value only);"
	| loopSize |
	"We assume long backward branches are always maximal size branches."
	loopSize := (receiver sizeCodeForEvaluatedEffect: encoder) + (encoder sizeJumpLong: -1).
	sizes := Array with: loopSize.
	^loopSize + (forValue ifTrue: [encoder sizePushSpecialLiteral: nil] ifFalse: [0])
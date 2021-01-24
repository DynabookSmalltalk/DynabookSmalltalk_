code generation
sizeCodeForEvaluatedFullClosureValue: encoder
	"The closure value primitives push the arguments and the copied values.
	 The compiler guarantees that any copied values come before all local temps.
	 So on full closure activation we need do nothing."
	(statements last == NodeNil
	 and: [self returns not]) ifTrue:
		[^(self sizeCodeExceptLast: encoder)
		 + encoder sizeReturnNilToCaller].
	^(self sizeCodeForEvaluatedValue: encoder)
	+ (self returns ifTrue: [0] ifFalse: [encoder sizeReturnTopToCaller])
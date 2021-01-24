scanning
blockMethodOrNil
	"If this instruction is a full block creation, answer the block's method, otherwise nil."

	| method |
	method := self method.
	^method encoderClass blockMethodOrNilFor: self in: method at: pc
instruction decoding
blockReturnConstant: value
	"Return Constant From Block bytecode."
	scanner pc < blockEnd ifTrue:
		[self doJoin]
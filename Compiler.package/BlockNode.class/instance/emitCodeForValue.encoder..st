code generation
emitCodeForValue: stack encoder: encoder
	encoder supportsFullBlocks ifTrue:
		[^self emitCodeForFullBlockValue: stack encoder: encoder].
	copiedValues do:
		[:copiedValue| copiedValue emitCodeForValue: stack encoder: encoder].
	closureCreationNode pc: encoder nextPC.
	encoder
		genPushClosureCopyNumCopiedValues: copiedValues size
		numArgs: arguments size
		jumpSize: size.
	stack
		pop: copiedValues size;
		push: 1.
	"Emit the body of the block"
	self emitCodeForEvaluatedClosureValue: stack encoder: encoder
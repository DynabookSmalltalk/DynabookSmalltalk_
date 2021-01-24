code generation
emitCodeForFullBlockValue: stack encoder: encoder
	copiedValues do:
		[:copiedValue| copiedValue emitCodeForValue: stack encoder: encoder].
	encoder
		genPushFullClosure: closureCreationNode index
		numCopied: copiedValues size.
	stack
		pop: copiedValues size;
		push: 1
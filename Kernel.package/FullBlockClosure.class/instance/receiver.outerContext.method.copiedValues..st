initialize-release
receiver: aReceiver outerContext: aContextOrNil method: aCompiledBlock copiedValues: anArrayOrNil
	receiver := aReceiver.
	outerContext := aContextOrNil.
	startpc := aCompiledBlock.
	numArgs := aCompiledBlock numArgs.
	1 to: self numCopiedValues do:
		[:i|
		self at: i put: (anArrayOrNil at: i)]
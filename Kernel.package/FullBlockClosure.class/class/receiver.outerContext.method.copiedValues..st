instance creation
receiver: aReceiver outerContext: aContextOrNil method: aCompiledBlock copiedValues: anArrayOrNil
	^(self new: anArrayOrNil basicSize)
		receiver: aReceiver
		outerContext: aContextOrNil
		method: aCompiledBlock
		copiedValues: anArrayOrNil
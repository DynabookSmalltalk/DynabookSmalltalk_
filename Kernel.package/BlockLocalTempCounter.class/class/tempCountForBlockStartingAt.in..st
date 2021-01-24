instance creation
tempCountForBlockStartingAt: startpc in: method
	^self new
		tempCountForBlockAt: (method encoderClass pcOfBlockCreationBytecodeForBlockStartingAt: startpc in: method)
		in: method
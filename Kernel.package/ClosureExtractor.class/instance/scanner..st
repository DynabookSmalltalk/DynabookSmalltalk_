accessing
scanner: anInstructionStream
	scanner := anInstructionStream.
	currentContext := Context
							sender: nil
							receiver: nil
							method: scanner method
							arguments: (Array new: scanner method numArgs)
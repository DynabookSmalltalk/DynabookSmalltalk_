*System-debugging support
runUntil: aConditionBlock
	"Simulate code execution until the provided condition is fulfilled."
	
	[(aConditionBlock isNil
		or: [self isTerminated])
		or: [aConditionBlock value: self suspendedContext]
	] whileFalse: [self step].

	"If we are already at a send, this next call should do nothing."
	self stepToSendOrReturn.
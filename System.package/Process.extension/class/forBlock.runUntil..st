*System-debugging
forBlock: aBlock runUntil: aConditionBlock
	"Create a process for the given block. Simulate code execution until the provided condition is fulfilled."

	^ aBlock newProcess
		runUntil: aConditionBlock;
		yourself
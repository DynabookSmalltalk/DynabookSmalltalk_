*System-debugging
forBlock: aBlock
	"Create a process and step into the block's method."
	
	^ self
		forBlock: aBlock
		runUntil: [:context | context method == aBlock method]
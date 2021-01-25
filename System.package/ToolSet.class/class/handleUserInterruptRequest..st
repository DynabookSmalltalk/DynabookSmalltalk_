debugging - handlers
handleUserInterruptRequest: aString
	"The user wants to interrupt a process, which might be unresponsive, to debug it.
	
	THE ACTIVE PROCESS *IS* A HELPER PROCESS with a priority higher than the preempted one. See EventSensor >> #userInterruptWatcher."

	^ self default
		ifNil: [self inform: 'No handler for user interrupts found.']
		ifNotNil: [:ts | ts handleUserInterruptRequest: aString]
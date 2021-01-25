scheduling & debugging
interruptName: labelString message: aMessage preemptedProcess: theInterruptedProcess
	"Create a Notifier on the active scheduling process with the given label."

	| preemptedProcess projectProcess |
	projectProcess := self uiProcess.
	preemptedProcess := theInterruptedProcess ifNil: [Processor preemptedProcess].
	
	"Only debug preempted process if its priority is >= projectProcess' priority"
	preemptedProcess priority < projectProcess priority 
		ifTrue:[preemptedProcess := projectProcess].

	"Give projects a change to clean up."
	self interruptCleanUpFor: preemptedProcess.

	^ preemptedProcess debugWithTitle: labelString full: false contents: aMessage
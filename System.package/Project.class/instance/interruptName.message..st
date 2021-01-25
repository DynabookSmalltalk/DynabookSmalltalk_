scheduling & debugging
interruptName: labelString message: aMessage
	"Create a Notifier on the active scheduling process with the given label."

	^ self
		interruptName: labelString
		message: aMessage
		preemptedProcess: nil
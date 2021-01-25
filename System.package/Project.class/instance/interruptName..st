scheduling & debugging
interruptName: labelString
	"Create a Notifier on the active scheduling process with the given label."

	^ self
		interruptName: labelString
		message: nil
		preemptedProcess: nil
system attributes
supportsQueueingFinalization
	"Answer whether the VM queues individual weak arrays for finalization, instead
	 of signalling the finalization semaphore once for all arrays and having the
	 WeakRegistry mechanism finalize all weak arrays, whether they need to or not."
	"SmalltalkImage current supportsQueueingFinalization"

	^(self vmParameterAt: 48) anyMask: 16
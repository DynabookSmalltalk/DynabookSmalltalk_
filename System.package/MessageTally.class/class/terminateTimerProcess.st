spying
terminateTimerProcess

	Timer ifNotNil: [
		Timer terminate.
		Timer := nil ].

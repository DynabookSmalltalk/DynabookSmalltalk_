background process
startUp: resuming

	Smalltalk processPreemptionYields ifTrue: [
		Smalltalk processPreemptionYields: false].

	resuming ifTrue: [
		Smalltalk installLowSpaceWatcher.
		self installIdleProcess].
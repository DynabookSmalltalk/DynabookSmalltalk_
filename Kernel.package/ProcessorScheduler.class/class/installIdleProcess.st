background process
installIdleProcess
	"Install a background process of the lowest possible priority that is always runnable."
	"Details: The virtual machine requires that there is aways some runnable process that
	 can be scheduled; this background process ensures that this is the case."

	BackgroundProcess ifNotNil: [BackgroundProcess terminate].
	BackgroundProcess := [self idleProcess] newProcess.
	BackgroundProcess priority: SystemRockBottomPriority.
	BackgroundProcess resume.
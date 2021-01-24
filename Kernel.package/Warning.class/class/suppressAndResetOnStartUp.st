suppress and reset
suppressAndResetOnStartUp
	"Suppress this kind of warning but reset that after the next image start up."
	
	self suppressed: true.
	self resetOnStartUp: true.
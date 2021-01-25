utilities
resumeProcess: aProcess
	"Adopt aProcess as the project process -- probably because of proceeding from a debugger"

	self flag: #toRemove. "mt: This seems to be quite specific for MorphicProject... and we have a MorphicDebugger to take care of #resumeProcess: ... Is this hook still needed?"
	self current uiProcess: aProcess.
	aProcess resume
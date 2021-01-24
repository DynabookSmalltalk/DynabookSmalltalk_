scheduling & debugging
recursiveError: msg

	"1a) If the recursion happens in a non-ui process, make sure to escalate it in the ui process."
	Processor activeProcess == self uiProcess ifFalse: [
		self addDeferredUIMessage: [super recursiveError: msg].
		^ Processor activeProcess suspend].
	
	"1b) Normal escalation of error recursion in the ui process." 
	^ super recursiveError: msg
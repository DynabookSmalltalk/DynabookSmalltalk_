initialize
openFullNoSuspendLabel: aString
	"Create, schedule and answer a full debugger with the given label. Do not terminate the current active process."

	super openFullNoSuspendLabel: aString.
	
	^ ToolBuilder default
		open: self
		label: aString
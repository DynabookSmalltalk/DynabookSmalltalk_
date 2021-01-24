initialize
openFullFromNotifier: notifierWindow
	"Create, schedule and answer a full debugger with the given label. Do not terminate the current active process."

	super openFullFromNotifier: notifierWindow.
	
	notifierWindow delete.
	
	^ ToolBuilder default
		open: self
		label: notifierWindow label
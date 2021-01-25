release
delete
	"You should not call this method directly. Call #close instead to make relevant checks first and inform users with interactive dialogs."

	self isTopProject ifTrue: [^ self].

	self isCurrentProject ifTrue: [
		self parent
			addDeferredUIMessage: [self delete];
			enter.
		"Execution stops here."
		Error signal].

	self removeChangeSetIfPossible.

	ProjectHistory forget: self.
	Project deletingProject: self.
actions
revertSelection
	| loader |
	selection ifNotNil:
		[loader := MCPackageLoader new.
		selection inverse applyTo: loader.
		self environmentInDisplayingImage beCurrentDuring: [loader loadWithName: self changeSetNameForInstall].
		self reverts add: selection.
		self
			advanceSelection;
			changed: #list ]
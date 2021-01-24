actions
installSelection
	| loader |
	selection ifNotNil:
		[loader := MCPackageLoader new.
		selection applyTo: loader.
		loader loadWithName: self changeSetNameForInstall.
		self reverts remove: selection ifAbsent: [].
		self changed: #list ]
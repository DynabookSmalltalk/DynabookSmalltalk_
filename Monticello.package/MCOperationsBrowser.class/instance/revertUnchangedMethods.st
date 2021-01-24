actions
revertUnchangedMethods
	"revert methods that only have changed timestamps"
	| loader unchangedMethods |
	unchangedMethods := items select: [:op | op isUnchangedMethod].
	(self confirm: ('Revert {1} methods that only differ in timestamp?' translated format: {unchangedMethods size}))
		ifTrue: [
			loader := MCPackageLoader new.
			unchangedMethods do: [:op | op inverse applyTo: loader].
			loader loadWithName: self changeSetNameForInstall].

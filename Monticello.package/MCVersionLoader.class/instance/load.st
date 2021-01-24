loading
load
	| loader |
	self checkForModifications.
	loader := MCPackageLoader new.
	versions do: [:ea |
		loader appendToPreamble: (String streamContents: [:s | ea logLoadingOn: s]).
		ea canOptimizeLoading
			ifTrue: [ea patch applyTo: loader]
			ifFalse: [loader updatePackage: ea package withSnapshot: ea snapshot]].
	loader loadWithNameLike: versions first info name.
	versions do: [:ea | ea workingCopy loaded: ea]
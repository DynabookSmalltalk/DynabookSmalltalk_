accessing
addVersion: aVersion
	| patch |
	previousRemovals addAll: currentRemovals definitions.
	currentRemovals := MCDefinitionIndex new.
	patch := aVersion canOptimizeLoading
		ifTrue: [aVersion patch]
		ifFalse: [aVersion snapshot patchRelativeToBase: aVersion package snapshot].
	patch applyTo: self.



morphic ui
packageSelection: aNumber
	selectedPackage := (aNumber between: 1 and: self packageList size)
		ifTrue: [ (self packageList at: aNumber) asString ].
	self versionSelection: 0.
	versionNames := nil.
	self changed: #packageSelection; changed: #versionList
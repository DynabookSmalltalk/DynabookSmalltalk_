morphic ui
workingCopyList
	^ self workingCopies collect:
		[:ea |
		(workingCopy notNil and: [workingCopy requiredPackages includes: ea package])
			ifTrue: [Text string: ea description emphasis: { TextEmphasis bold }]
			ifFalse: [ea description]]
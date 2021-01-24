browse
buildDebugMenu: aHandMorph
	| aMenu |
	aMenu := super buildDebugMenu: aHandMorph.
	aMenu addLine.
	aMenu add: 'browse action code' translated target: self action: #browseImplementationOfActionSelector.
	aMenu add: 'debug action invocation' translated target: self action: #debugAction.
	^ aMenu
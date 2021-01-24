debug and other
buildDebugMenu: aHandMorph

	| aMenu |
	aMenu := super buildDebugMenu: aHandMorph.
	aMenu addLine.
	aMenu add: 'browse get-list code' translated target: self action: #browseImplementationOfGetListSelector.
	aMenu add: 'debug get-list invocation' translated target: self action: #debugGetList.
	^ aMenu
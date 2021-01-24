morphic ui
refreshEmphasis
	| identifyNewer |
	identifyNewer := newer isNil.
	identifyNewer ifTrue: [ newer := Set new ].
	self initializeEmphasis.
	MCWorkingCopy allManagers do:
		[ : each | self identifyLoadedAndInherited: each.
		identifyNewer ifTrue: [ self identifyNewerVersionsOf: each ] ]
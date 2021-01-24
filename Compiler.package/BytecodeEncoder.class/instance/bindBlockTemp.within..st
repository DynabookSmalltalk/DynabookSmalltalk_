temps
bindBlockTemp: name within: aBlockNode
	| nArgs |
	(nArgs := aBlockNode nArgsSlot) ifNil:
		[aBlockNode nArgsSlot: (nArgs := 0)].
	nArgs >= (CompiledMethod fullFrameSize - 1) ifTrue:
		[^self notify: 'Too many temporaries'].
	aBlockNode nArgsSlot: nArgs + 1.
	^self bindTemp: name
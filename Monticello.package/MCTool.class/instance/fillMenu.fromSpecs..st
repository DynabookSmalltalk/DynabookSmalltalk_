morphic ui
fillMenu: aMenu fromSpecs: anArray
	anArray do:
		[:spec |
		spec == #addLine
			ifTrue: [aMenu addLine]
			ifFalse:
				[aMenu
					add: spec first
					target: self
					selector: spec second
					argumentList: (spec allButFirst: 2)]].
	^aMenu
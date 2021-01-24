menus
getConflictMenu: aMenu
	selection remoteChosen
		ifTrue: [aMenu add: 'undo keep change' target: self selector: #clearChoice]
		ifFalse: [aMenu add: 'keep change' target: self selector: #chooseRemote].
	selection localChosen
		ifTrue: [aMenu add: 'undo reject change' target: self selector: #clearChoice]	
		ifFalse: [aMenu add: 'reject change' target: self selector: #chooseLocal].
	^ aMenu
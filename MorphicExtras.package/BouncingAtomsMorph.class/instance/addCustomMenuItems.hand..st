menu
addCustomMenuItems: aCustomMenu hand: aHandMorph

	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu add: 'start bouncing' translated action: #startStepping.
	aCustomMenu add: 'start infection' translated action: #startInfection.
	aCustomMenu add: 'set atom count' translated action: #setAtomCount.
	aCustomMenu add: 'show infection history' translated action: #showInfectionHistory:.

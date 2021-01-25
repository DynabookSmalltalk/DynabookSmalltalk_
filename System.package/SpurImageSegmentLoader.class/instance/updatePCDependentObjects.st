filling
updatePCDependentObjects
	pcDependentObjects do:
		[:contextOrBlock|

		contextOrBlock isContext ifTrue:
			[contextOrBlock pc ifNotNil:
				[:pc| contextOrBlock pc: (self mapPC: pc in: contextOrBlock method)]].

		(contextOrBlock isBlock
		 and: [contextOrBlock isFullBlock not])ifTrue:
			[contextOrBlock instVarNamed: 'startpc' put: (self mapPC: contextOrBlock startpc in: contextOrBlock method)]]
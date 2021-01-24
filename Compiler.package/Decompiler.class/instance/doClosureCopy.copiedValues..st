control
doClosureCopy: aCompiledBlock copiedValues: blockCopiedValues
	| savedTemps savedTempVarCount savedNumLocalTemps savedMethod savedPC
	  blockArgs blockTemps blockTempsOffset block |
	savedTemps := tempVars.
	savedTempVarCount := tempVarCount.
	savedNumLocalTemps := numLocalTemps.
	numLocalTemps := aCompiledBlock numTemps - aCompiledBlock numArgs - blockCopiedValues size.
	blockTempsOffset := aCompiledBlock numArgs + blockCopiedValues size.
	(blockStartsToTempVars notNil "implies we were intialized with temp names."
	 and: [blockStartsToTempVars includesKey: aCompiledBlock])
		ifTrue:
			[tempVars := blockStartsToTempVars at: aCompiledBlock]
		ifFalse:
			[blockArgs := (1 to: aCompiledBlock numArgs) collect:
							[:i| (constructor
									codeTemp: i - 1
									named: 't', (tempVarCount + i) printString)
								  beBlockArg].
			blockTemps := (1 to: numLocalTemps) collect:
							[:i| constructor
									codeTemp: i + blockTempsOffset - 1
									named: 't', (tempVarCount + i + aCompiledBlock numArgs) printString].
			tempVars := blockArgs, blockCopiedValues, blockTemps].
	tempVarCount := tempVarCount + aCompiledBlock numArgs + numLocalTemps.
	savedMethod := self method. savedPC := pc.
	super method: (method := aCompiledBlock) pc: aCompiledBlock initialPC.
	block := [self blockTo: aCompiledBlock endPC]
				ensure: [super method: (method := savedMethod) pc: savedPC].
	stack addLast: ((constructor
						codeArguments: (tempVars copyFrom: 1 to: aCompiledBlock numArgs)
						temps: (tempVars copyFrom: blockTempsOffset + 1 to: blockTempsOffset + numLocalTemps)
						block: block)
							pc: aCompiledBlock -> pc; "c.f. BytecodeEncoder>>pc"
							yourself).
	tempVars := savedTemps.
	tempVarCount := savedTempVarCount.
	numLocalTemps := savedNumLocalTemps
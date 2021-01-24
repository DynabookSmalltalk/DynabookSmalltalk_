scheduling & debugging
syntaxError: aSyntaxErrorNotification

	| compilerProcess errorWasInUIProcess debugger |
	debugger := (super syntaxError: aSyntaxErrorNotification) model debugger.
	
	compilerProcess := Processor activeProcess.
	errorWasInUIProcess := self spawnNewProcessIfThisIsUI: compilerProcess.
	
	debugger errorWasInUIProcess: errorWasInUIProcess.
	compilerProcess suspend.
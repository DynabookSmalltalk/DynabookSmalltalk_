opening
openOn: processToDebug context: context label: title contents: contentsStringOrNil fullView: full 
	
	| debugger uiBlock |
	debugger := self new
		process: processToDebug context: context;
		errorWasInUIProcess: (Project current spawnNewProcessIfThisIsUI: processToDebug).
	
	uiBlock := [
		full
			ifTrue: [debugger openFullNoSuspendLabel: title]
			ifFalse: [debugger openNotifierNoSuspendContents: contentsStringOrNil label: title].
	
		"Try drawing the debugger tool at least once to avoid freeze."
		debugger topView ifNotNil: [:window | window world displayWorld. "Not safely!"].
	].
		
	"Schedule debugging in a deferred UI message if necessary. Note that only the ui process should execute ui code."
	(Project current uiProcess isActiveProcess not or: [processToDebug isActiveProcess])
		ifTrue: [Project current addDeferredUIMessage: uiBlock]
		ifFalse: uiBlock.
	
	processToDebug suspend.
	
	"Get here only if active process is not the process-to-debug. So in tests, use a helper process if you want to access this return value."
	^ debugger
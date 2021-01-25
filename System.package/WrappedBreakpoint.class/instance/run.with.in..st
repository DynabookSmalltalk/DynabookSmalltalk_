evaluation
run: aSelector with: anArray in: aReceiver
	| process |
	process := Process 
		forContext: (Context
			sender: thisContext sender
			receiver: aReceiver
			method: method
			arguments: anArray)
		priority: Processor activeProcess priority.
	ToolSet
		debugProcess: process
		context: process suspendedContext
		label:  'Breakpoint in ' , method methodClass name , '>>#' , method selector
		contents: nil
		fullView: true.
	Project current spawnNewProcessIfThisIsUI: Processor activeProcess.
	thisContext swapSender: nil.
	Processor activeProcess terminate
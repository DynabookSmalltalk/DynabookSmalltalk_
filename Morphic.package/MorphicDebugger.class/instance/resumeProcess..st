private
resumeProcess: processToResume 

	processToResume isTerminated ifFalse: [
		errorWasInUIProcess ifTrue: [Project current uiProcess: processToResume].
		processToResume resume.
		errorWasInUIProcess ifTrue: [Processor terminateActive]].
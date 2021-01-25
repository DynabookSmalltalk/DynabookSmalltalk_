debugging
debugException: anException
	"For convenience. Enable users to debug an exception that occurred in the active process later on. Note that the active process is the process where the exception was raised, which might not be the current ui process. It is okay to ignore this request in a custom toolset.
	
	Example print-it: 
	
	[ self halt. 3+4 ]
		on: Halt do: [:ex | ToolSet debugException: ex. ex resume] "

	^ self default ifNotNil: [:ts |ts debugException: anException]
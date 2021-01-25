testing
testClassFaultOn: someClass  "NativeImageSegment testClassFaultOn: FileList"  
	"Swap out a class with an existing instance.  Then send a message to the inst.
	This will cause the VM to choke down deep and resend #cannotInterpret:.
	This in turn will send a message to the stubbed class which will choke
	and resend: #doesNotUnderstand:.  Then, if we're lucky, things will start working."

	(NativeImageSegment new copyFromRoots: (Array with: someClass with: someClass class) 
		sizeHint: 0) extract; writeToFile: 'test'.
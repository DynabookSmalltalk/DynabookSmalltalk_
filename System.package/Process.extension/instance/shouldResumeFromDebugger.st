*System-debugging support
shouldResumeFromDebugger
	"Tools can construct processes that might interfere with existing ones. For example, one process can be copied for inspecting the state through that copy later on. Resuming both - original and copy - at some point might result in unexpected interference. To prevent or help In such situations, the copy can be flagged to not be resumable from the debugger. Note that you can always resume a process with #resume even if a tool tells you otherwise."
	 
	^ self environmentAt: #shouldResumeFromDebugger ifAbsent: [true]
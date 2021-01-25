scheduling & debugging
recursiveError: errorMessage
	"This method is called when the error handling results in a recursion in calling on error: or halt or halt:, which basically means that the debugger cannot be opened."

	self primitiveError: errorMessage.
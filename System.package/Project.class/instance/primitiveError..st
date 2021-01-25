scheduling & debugging
primitiveError: errorMessage
	"System error handling has failed. Try something else to keep the system alive."

	Project tryOtherProjectForRecovery: errorMessage.
	Project tryEmergencyEvaluatorForRecovery: errorMessage.
	
	self restoreDisplay.
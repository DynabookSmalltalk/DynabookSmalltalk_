*System-Recovery-error handling
primitiveError: aString 

	self flag: #discussion. "mt: Is this still required?"
	Project current primitiveError: aString.
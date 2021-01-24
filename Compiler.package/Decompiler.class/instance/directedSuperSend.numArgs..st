instruction decoding
directedSuperSend: selector numArgs: numArgs
	stack removeLast. "Discard the pushed class."
	^self send: selector super: true numArgs: numArgs
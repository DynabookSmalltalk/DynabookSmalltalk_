class initialization
initialize
	(Smalltalk at: #OMeta2Fail ifAbsent: []) class == self
		ifFalse: [Smalltalk at: #OMeta2Fail put: self new]
private
pred: aBooleanValue

	" may want to have the compiler inline this automatically, for performance "
	aBooleanValue ifTrue: [^ true].
	OMeta2Fail signal
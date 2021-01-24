code generation
reserve: encoder 
	"If this is a yet unused literal of type -code, reserve it."

	index ifNil:
		[index := encoder sharableLitIndex: key.
		 code := Send]
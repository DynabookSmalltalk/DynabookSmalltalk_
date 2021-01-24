accessing
at: index ifPresent: elementBlock ifAbsent: exceptionBlock 
	"Answer the value of elementBlock on the element at position index.  If I do not contain an element at index, answer the result of evaluating exceptionBlock."
	^ elementBlock value:
		(self
			at: index
			ifAbsent: [ ^ exceptionBlock value ])
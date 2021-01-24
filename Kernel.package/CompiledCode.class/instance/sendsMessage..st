testing
sendsMessage: aSelector
	"eem: this should be deprecated. This method does not check if a method sends a message;
	 it checks if a method sends a message with a particular selector."
	self flag: #todo.
	self messagesDo: [:selector |
		selector = aSelector ifTrue: [^ true]].
	^ false
browse
browseAllImplementorsOf: selector 
	"Create and schedule a message browser on each method that implements 
	the message whose selector is the argument, selector. For example,  
	Smalltalk browseAllImplementorsOf: #at:put:."
	^ self
		browseMessageList: (self allImplementorsOf: selector)
		name: 'Implementors of ' , selector
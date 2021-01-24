accessing
localsNodes
	"Answer the correctly ordered sequence of local nodes (arguments and temporaries) in the receiver."
	^arguments asArray, copiedValues, temporaries
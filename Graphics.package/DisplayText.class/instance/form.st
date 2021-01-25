accessing
form 
	"Answer the form into which the receiver's display bits are cached."

	form == nil ifTrue: [self composeForm].
	^form
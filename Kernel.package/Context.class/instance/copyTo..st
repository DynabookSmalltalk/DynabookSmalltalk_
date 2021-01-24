query
copyTo: aContext
	"Copy self and my sender chain down to, but not including, aContext. End of copied chain will have nil sender. Assume that there is no loop in the context chain."

	| currentContext senderContext copy |
	self == aContext ifTrue: [ ^nil ].
	currentContext := copy := self copy.
	[ 
		senderContext := (currentContext sender ifNil: [ ^copy ]) copy.
		currentContext privSender: senderContext.
		currentContext := senderContext ] repeat
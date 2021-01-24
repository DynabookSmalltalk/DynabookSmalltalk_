testing
sendsSelector: aSelector 
	"Answer if the receiver sends a message whose selector is aSelector."

	self selectorsDo:
		[:selector | selector = aSelector ifTrue: [^true]].
	self flag: #todo. "The use of #= instead of #== is extremely dubious, and IMO erroneous. eem 2/18/2020"
	^false
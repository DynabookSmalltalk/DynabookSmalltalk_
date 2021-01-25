instance creation
instance
	"answer the broker singleton"
	^ instance isNil
		ifTrue: [self error: 'RSTBroker not started! (see methods in category "running")']
		ifFalse: [instance]
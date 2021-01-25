as yet unclassified
instanceForIP: ipAddress

	^self allInstances detect: [ :x | 
		x ipAddress = ipAddress
	] ifNone: [nil]

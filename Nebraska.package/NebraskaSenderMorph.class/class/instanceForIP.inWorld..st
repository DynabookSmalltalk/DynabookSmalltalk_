as yet unclassified
instanceForIP: ipAddress inWorld: aWorld

	^self allInstances detect: [ :x | 
		x world == aWorld and: [x ipAddress = ipAddress]
	] ifNone: [nil]

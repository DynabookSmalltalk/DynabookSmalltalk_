as yet unclassified
chatWindowForIP: ipAddress name: senderName picture: aForm inWorld: aWorld

	^self allInstances 
		detect: [ :x | x world == aWorld] 
		ifNone: [
			NebraskaCommunicatorMorph playArrivalSound.
			self new open
		].


as yet unclassified
nameForIPAddress: ipString

	| senderMorphs |

	senderMorphs := NebraskaSenderMorph allInstances select: [ :x | 
		x userName notNil and: [x ipAddress = ipString]
	].
	senderMorphs isEmpty ifTrue: [^nil].
	^senderMorphs first userName


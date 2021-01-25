as yet unclassified
pictureForIPAddress: ipString

	| senderMorphs |

	senderMorphs := NebraskaSenderMorph allInstances select: [ :x | 
		x userPicture notNil and: [x ipAddress = ipString]
	].
	senderMorphs isEmpty ifTrue: [^nil].
	^senderMorphs first userPicture


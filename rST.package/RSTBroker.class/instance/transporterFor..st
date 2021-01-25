resolving objects
transporterFor: anObject 
	"answer the appropiate transporter for anObject"
	anObject isRemote
		ifTrue: [^ RSTObjectTransporter reference: anObject xxxRemoteObjectID].
	^ anObject remoteType == #copy
		ifTrue: [RSTObjectTransporter copy: anObject]
		ifFalse: [RSTObjectTransporter
				reference: (self remoteObjectIDFor: anObject)]
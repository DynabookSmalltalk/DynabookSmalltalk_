resolving objects
localObjectFor: aRemoteObjectID 
	"answer a proxy if the reference points to other VM, otherwise answer  
	the 'real' object"
	^ brokerID = aRemoteObjectID brokerID
		ifTrue: [exportedObjects
				at: aRemoteObjectID objectID
				ifAbsent: [RSTObjectNotFound signal: aRemoteObjectID objectID asString]]
		ifFalse: [aRemoteObjectID asProxy]
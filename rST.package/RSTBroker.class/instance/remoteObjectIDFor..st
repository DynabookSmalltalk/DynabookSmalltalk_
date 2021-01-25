resolving objects
remoteObjectIDFor: anObject 
	"answer a RemoteObjectID for aObject"
	| objectID |

	objectID _ exportedObjects keyFor: anObject.
	^ RSTRemoteObjectID brokerID: brokerID objectID: objectID
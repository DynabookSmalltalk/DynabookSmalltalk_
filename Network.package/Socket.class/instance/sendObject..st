sending-receiving objects
sendObject: anObject 
	"sends a serialized object to this socket"
	| encoded |
	encoded _ ReferenceStream streamedRepresentationOf: anObject.
	self sendData: encoded
external objects
registerExternalObject: anObject
	"Register the given object in the external objects array and return its index. If it is already there, just return its index."

	^ExternalObjectTable current registerExternalObject: anObject
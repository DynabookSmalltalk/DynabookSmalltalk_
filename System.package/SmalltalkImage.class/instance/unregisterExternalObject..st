external objects
unregisterExternalObject: anObject
	"Unregister the given object in the external objects array. Do nothing if it isn't registered."

	ExternalObjectTable current unregisterExternalObject: anObject
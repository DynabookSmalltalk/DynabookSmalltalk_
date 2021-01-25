private
spaceToEncode: anObject
	"return the number of characters needed to encode the given object"
	^ 4 + (self smartRefStreamEncode: anObject) size
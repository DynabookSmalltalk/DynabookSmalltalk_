private
encodeObject: object  into: buffer  startingAt: startIndex
	"encode the given object into the given buffer"
	| encoded |
	encoded := self smartRefStreamEncode: object.
	buffer putInteger32: encoded size at: startIndex.
	buffer replaceFrom: startIndex+4 to: startIndex+4+(encoded size)-1 with: encoded.

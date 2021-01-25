private
smartRefStreamEncode: anObject
	| encodingStream |
	"encode an object using SmartRefStream"

	anObject == lastEncodedObject ifTrue: [
		^encodingOfLastEncodedObject ].


	encodingStream := RWBinaryOrTextStream on: ''.
	encodingStream reset.
	(SmartRefStream on: encodingStream) nextPut: anObject.
	
	lastEncodedObject := anObject.
	encodingOfLastEncodedObject := encodingStream contents.

	^encodingOfLastEncodedObject
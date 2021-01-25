private-IO
nextPut: anObject

	socketWriterProcess ifNil: [^self].
	outObjects addLast: anObject.
	"return the argument - added by kwl"
	^ anObject
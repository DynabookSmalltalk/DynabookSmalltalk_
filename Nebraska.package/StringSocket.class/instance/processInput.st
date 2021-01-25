private-IO
processInput
	| totalReceived chunkOfData |
	"do as much input as possible"

	self flag: #XXX.  "should have resource limits here--no more than X objects and Y bytes"

	chunkOfData := socket receiveAvailableDataIntoBuffer: self readBuffer.
	self addToInBuf: chunkOfData.
	totalReceived := chunkOfData size.

	totalReceived > 0 ifTrue: [
		NebraskaDebug at: #SendReceiveStats add: {'GET'. totalReceived}.
	].

	[ self gotSomething ] whileTrue: [].		"decode as many string arrays as possible"

	self shrinkInBuf.
private
processInput
	"recieve some data"
	| inObjectData |

	[ socket dataAvailable ] whileTrue: [
		"read as much data as possible"
		self addToInBuf: socket receiveAvailableData.


		"decode as many objects as possible"
		[self nextObjectLength ~~ nil and: [ self nextObjectLength <= (self inBufSize + 4) ]] whileTrue: [
			"a new object has arrived"
			inObjectData := inBuf copyFrom: (inBufIndex + 4) to: (inBufIndex + 3 + self 	nextObjectLength).
			inBufIndex := inBufIndex + 4 + self nextObjectLength.
	
			inObjects addLast: (RWBinaryOrTextStream with: inObjectData) reset fileInObjectAndCode ].

		self shrinkInBuf. ].
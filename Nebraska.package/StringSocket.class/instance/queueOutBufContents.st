private-IO
queueOutBufContents

	bytesInOutputQueue := bytesInOutputQueue + outBufIndex - 1.
	outputQueue nextPut: {outBuf. outBufIndex - 1}.
	NebraskaDebug at: #queuedbufferSizes add: {outBufIndex - 1}.
	outBufIndex := 1.
	outBuf := String new: 11000.
	

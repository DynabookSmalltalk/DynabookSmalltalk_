private-IO
transmitQueueNext

	| bufTuple |

	bufTuple := outputQueue next.
	bytesInOutputQueue := bytesInOutputQueue - bufTuple second max: 0.
	[
		self 
			sendDataCautiously: bufTuple first 
			bytesToSend: bufTuple second.
	]
		on: Error
		do: [ :ex |
			transmissionError := true.
		].
	^transmissionError not


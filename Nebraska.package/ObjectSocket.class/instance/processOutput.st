encoding/decoding
processOutput
	"loop sending data as long as there is data to send, and the socket is ready to receive more data"
	[ socket sendDone and: [ outBuf notNil or: [ outObjects isEmpty not ] ] ] whileTrue: [
		| amountSent |

		outBuf isNil ifTrue: [
			| nextSize |
			"no data in the current buffer; make a new buffer and encode some more"
			outBuf := String new: ((self spaceToEncode: outObjects first) max: 8000).
			outBufIndex := 1.
			outBufSize := 0.

			[	outObjects isEmpty not and: [
					nextSize := self spaceToEncode: outObjects first.
					nextSize <= (outBuf size - outBufSize + 1) ]
			] whileTrue: [
				self encodeObject: outObjects first into: outBuf startingAt: outBufSize+1.
				outBufSize := outBufSize + nextSize.
				outObjects removeFirst ] ].

		"at this point, the buffer definitely has data in it to send.  Send some"
		amountSent := socket sendSomeData: outBuf startIndex: outBufIndex count: (outBufSize - outBufIndex + 1).
		outBufIndex := outBufIndex + amountSent.
		outBufIndex > outBufSize ifTrue: [ outBuf := nil ]  ].


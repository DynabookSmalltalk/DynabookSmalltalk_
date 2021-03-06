sending
sendSomeData: aStringOrByteArray startIndex: startIndex count: count for: aTimeoutInSeconds
	"Send up to count bytes of the given data starting at the given index. Answer the number of bytes actually sent."
	"Note: This operation may have to be repeated multiple times to send a large amount of data."

	(self waitForSendDoneFor: aTimeoutInSeconds) ifFalse: [
		ConnectionTimedOut signal: 'send data timeout; data not sent'.
		^0 ].
	^self primSocket: socketHandle
		sendData: aStringOrByteArray
		startIndex: startIndex
		count: count
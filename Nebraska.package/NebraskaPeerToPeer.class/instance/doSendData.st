sending
doSendData

	| totalLength myData allTheData |

	myData := dataQueue next ifNil: [socket sendData: '0 '. ^false].
	totalLength := (myData collect: [ :x | x size]) sum.
	socket sendData: totalLength printString, self makeOptionalHeader, ' '.
	allTheData := WriteStream on: (String new: totalLength).
	myData do: [ :chunk | allTheData nextPutAll: chunk asString].
	NebraskaDebug at: #peerBytesSent add: {totalLength}.
	self sendDataCautiously: allTheData contents.
	^true


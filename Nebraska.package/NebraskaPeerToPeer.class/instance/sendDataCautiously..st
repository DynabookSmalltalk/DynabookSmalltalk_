sending
sendDataCautiously: aStringOrByteArray
	"Send all of the data in the given array, even if it requires multiple calls to send it all. Return the number of bytes sent. Try not to send too much at once since this seemed to cause problems talking to a port on the same machine"

	| bytesSent bytesToSend count |

	bytesToSend := aStringOrByteArray size.
	bytesSent := 0.
	[bytesSent < bytesToSend] whileTrue: [
		count := socket 
			sendSomeData: aStringOrByteArray 
			startIndex: bytesSent + 1  
			count: (bytesToSend - bytesSent min: 4000).
		bytesSent := bytesSent + count.
		communicatorMorph commResult: {#commFlash -> true}.
		(Delay forMilliseconds: 10) wait.
	].
	^ bytesSent

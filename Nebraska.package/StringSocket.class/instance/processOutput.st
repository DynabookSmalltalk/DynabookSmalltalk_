private-IO
processOutput

	| arrayToWrite size bytesSent timeStartSending t itemsSent now timeSlot bucketAgeInMS bytesThisSlot |

	outBufIndex := 1.
	itemsSent := bytesSent := 0.
	timeStartSending := Time millisecondClockValue.
	[outObjects isEmpty not and: [self isConnected]] whileTrue: [
		arrayToWrite := outObjects removeFirst.
		size := self addToOutBuf: arrayToWrite.
		bytesSent := bytesSent + size.
		itemsSent := itemsSent + 1.
		outBufIndex > 10000 ifTrue: [self queueOutBufContents].
	].
	outBufIndex > 1 ifTrue: [self queueOutBufContents].
	bytesSent > 0 ifTrue: [
		MaxRatesSeen ifNil: [MaxRatesSeen := Dictionary new].
		now := Time millisecondClockValue.
		t := now - timeStartSending.
		timeSlot := now // 10000.	"ten second buckets"
		bucketAgeInMS := now \\ 10.
		bytesThisSlot := (MaxRatesSeen at: timeSlot ifAbsent: [0]) + bytesSent.
		MaxRatesSeen 
			at: timeSlot 
			put: bytesThisSlot.
		NebraskaDebug 
			at: #SendReceiveStats 
			add: {'put'. bytesSent. t. itemsSent. bytesThisSlot // (bucketAgeInMS max: 100)}.
	].

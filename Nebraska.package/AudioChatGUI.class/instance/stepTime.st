testing
stepTime

	myrecorder ifNil: [^200].
	myrecorder isRecording ifFalse: [^200].
	^20
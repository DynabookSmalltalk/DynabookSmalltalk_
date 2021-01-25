sending
talkButtonUp

	theTalkButton recolor: self buttonColor.
	self handsFreeTalking ifFalse: [^self stop].
	myrecorder isRecording ifTrue: [
		theTalkButton label: 'Talk'.
		^self stop.
	].
	self record.
	theTalkButton label: 'TALKING'.



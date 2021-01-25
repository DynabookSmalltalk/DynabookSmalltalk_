stepping and presenter
step

	| now |
	super step.
	self transmitWhileRecording ifTrue: [self sendAnyCompletedSounds].
	self handsFreeTalking & myrecorder isRecording ifTrue: [
		now := Time millisecondClockValue.
		((handsFreeTalkingFlashTime ifNil: [0]) - now) abs > 200 ifTrue: [
			theTalkButton color: (
				theTalkButton color = self buttonColor 
						ifTrue: [Color white] 
						ifFalse: [self buttonColor]
			).
			handsFreeTalkingFlashTime := now.
		].
	].
	self class playOnArrival ifTrue: [self playNextMessage].

	"myrecorder ifNotNil: [
		myrecorder recorder samplingRate printString ,'   ',
		SoundPlayer samplingRate printString,'    '

		displayAt: 0@0
	]."
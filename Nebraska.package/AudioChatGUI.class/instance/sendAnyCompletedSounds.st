sending
sendAnyCompletedSounds

	| soundsSoFar firstCompleteSound |

	myrecorder isRecording ifFalse: [^self].
	mytargetip isEmpty ifTrue: [^self].
	soundsSoFar := myrecorder recorder recordedSound ifNil: [^self].
	firstCompleteSound := soundsSoFar removeFirstCompleteSoundOrNil ifNil: [^self].
	self sendOneOfMany: firstCompleteSound.
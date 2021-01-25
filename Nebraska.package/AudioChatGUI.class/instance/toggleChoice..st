stuff
toggleChoice: aSymbol

	aSymbol == #playOnArrival ifTrue: [
		^PlayOnArrival := self class playOnArrival not
	].
	aSymbol == #transmitWhileRecording ifTrue: [
		transmitWhileRecording := self transmitWhileRecording not.
		self changeTalkButtonLabel.
		^transmitWhileRecording
	].
	aSymbol == #handsFreeTalking ifTrue: [
		handsFreeTalking := self handsFreeTalking not.
		self changeTalkButtonLabel.
		^handsFreeTalking
	].



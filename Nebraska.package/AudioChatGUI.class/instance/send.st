sending
send

	| null rawSound aSampledSound |

	mytargetip isEmpty ifTrue: [
		^self inform: 'You must connect with someone first.'.
	].
	rawSound := myrecorder recorder recordedSound ifNil: [^self].
	aSampledSound := rawSound asSampledSound.
"Smalltalk at: #Q3 put: {rawSound. rawSound asSampledSound. aCompressedSound}."
	self transmitWhileRecording ifTrue: [
		self sendOneOfMany: rawSound asSampledSound.
		queueForMultipleSends ifNotNil: [queueForMultipleSends nextPut: nil].
		queueForMultipleSends := nil.
		^self
	].

	null := String with: 0 asCharacter.
	NebraskaPeerToPeer new 
		sendSomeData: {
			NebraskaIncomingMessage typeAudioChat,null. 
			Preferences defaultAuthorName,null.
			aSampledSound originalSamplingRate asInteger printString,null.
			(mycodec compressSound: aSampledSound) channels first.
		}
		to: mytargetip
		for: self.


sending
sendOneOfMany: aSampledSound

	| null message aCompressedSound t ratio resultBuf maxVal |

	self samplingRateForTransmission = aSampledSound originalSamplingRate ifTrue: [
		aCompressedSound := mycodec compressSound: aSampledSound.
	] ifFalse: [
		t := [ | oldSamples val newCount fromIndex |
			ratio := aSampledSound originalSamplingRate // self samplingRateForTransmission.
			oldSamples := aSampledSound samples.
			newCount := oldSamples monoSampleCount // ratio.
			resultBuf := SoundBuffer newMonoSampleCount: newCount.
			fromIndex := 1.
			maxVal := 0.
			1 to: newCount do: [ :i |
				maxVal := maxVal max: (val := oldSamples at: fromIndex).
				resultBuf at: i put: val.
				fromIndex := fromIndex + ratio.
			].
		] timeToRun.
		NebraskaDebug at: #soundReductionTime add: {t. maxVal}.
		maxVal < 400 ifTrue: [
			NebraskaDebug at: #soundReductionTime add: {'---dropped---'}.
			^self
		].		"awfully quiet"
		aCompressedSound := mycodec compressSound: (
			SampledSound new 
				setSamples: resultBuf 
				samplingRate: aSampledSound originalSamplingRate // ratio
		).
	].

	null := String with: 0 asCharacter.
	message := {
		NebraskaIncomingMessage typeAudioChatContinuous,null. 
		Preferences defaultAuthorName,null.
		aCompressedSound samplingRate asInteger printString,null.
		aCompressedSound channels first.
	}.
	queueForMultipleSends ifNil: [
		queueForMultipleSends := NebraskaPeerToPeer new 
			sendSomeData: message
			to: mytargetip
			for: self
			multiple: true.
	] ifNotNil: [
		queueForMultipleSends nextPut: message
	].


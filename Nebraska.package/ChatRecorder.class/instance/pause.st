as yet unclassified
pause
	"Go into pause mode. The record level continues to be updated, but no sound is recorded."

	paused := true.
	((currentBuffer ~~ nil) and: [nextIndex > 1])
		ifTrue: [self emitPartialBuffer.
				self allocateBuffer].

	soundPlaying ifNotNil: [
		soundPlaying pause.
		soundPlaying := nil].

	self stopRecording.

	"Preferences canRecordWhilePlaying ifFalse: [self stopRecording]."

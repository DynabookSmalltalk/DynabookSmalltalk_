as yet unclassified
playback
	"Playback the sound that has been recorded."

	self pause.
	soundPlaying := self recordedSound ifNil: [^self].
	soundPlaying play.

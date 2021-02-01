simple keyboard
mouseDownPitch: midiKey event: event noteMorph: keyMorph

	| sel noteEvents |
	event hand hasSubmorphs ifTrue: [^ self  "no response if drag something over me"].
	keyMorph color: playingKeyColor.
	(sel := pianoRoll selection) ifNil: [^ self].
	insertMode ifTrue:
		[sel := pianoRoll selectionForInsertion.
		insertMode := false].
	sel = prevSelection ifFalse:
		["This is a new selection -- need to determine start time"
		sel third = 0
			ifTrue: [startOfNextNote := 0]
			ifFalse: [startOfNextNote := ((pianoRoll score tracks at: sel first)
										at: sel third) endTime.
					startOfNextNote := startOfNextNote + self fullDuration - 1
										truncateTo: self fullDuration]].
	noteEvents := self addNoteEventAt:startOfNextNote  rootNote: midiKey +23.
	soundPlaying ifNotNil: [soundPlaying stopGracefully].
	(soundPlaying := self soundForEvent: noteEvents inTrack: sel first) play.
	prevSelection := pianoRoll selection.
	startOfNextNote := startOfNextNote + self fullDuration.
simple keyboard
addNoteEventAt: eventTime rootNote: rootNote
   | noteEvent noteEvents semitones |
   semitones := chordSemitones.
   buildingChord ifFalse:[ semitones := #(0)].
   noteEvents := OrderedCollection new.
   semitones do:
   [: semitone | noteEvent := NoteEvent new time: eventTime; duration: self noteDuration;
			key: rootNote + semitone velocity: self velocity channel: 1.
			pianoRoll appendEvent: noteEvent fullDuration: self fullDuration.
			noteEvents add: noteEvent].
  ^noteEvents
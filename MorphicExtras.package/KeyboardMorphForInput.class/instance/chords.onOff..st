note controls
chords: chord onOff: ignored   
	"Select the semi tones of the chord from the chordDictonary."

	self allMorphsDo:
		[:m | ((m isMemberOf: SimpleSwitchMorph)
				and: [m actionSelector == #chords:onOff:])
				ifTrue: [m setSwitchState: m arguments first = chord]].
	chordSemitones := chordDictionary at: chord.
	
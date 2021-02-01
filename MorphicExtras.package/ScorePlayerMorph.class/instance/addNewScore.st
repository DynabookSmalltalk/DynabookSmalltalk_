menu
addNewScore
	"Open a MIDI score and re-init controls..."
	| score player |

	score := MIDIScore new.
	score tracks: (Array with: Array new).
	score trackInfo: #('Instrument').
	player := ScorePlayer onScore: score.
	^self onScorePlayer: player title: 'new'
menu
addTrackToScore
	"add a instrument track to the current score"
	| score tracks trackInfo player |
	score := scorePlayer score.
      tracks := score tracks copyWith:#().
	score tracks: tracks.
      trackInfo := score trackInfo copyWith: 'Instrument'.
	score trackInfo: trackInfo.
	player := ScorePlayer onScore: score.
	^self onScorePlayer: player title: 'new'
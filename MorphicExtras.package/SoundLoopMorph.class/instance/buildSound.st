playing
buildSound
	"Build a compound sound for the next iteration of the loop."

	| mixer soundMorphs |
	mixer := MixedSound new.
	mixer add: (RestSound dur: (self width - (2 * self borderWidth)) / 128.0).
	soundMorphs := self submorphs select: [:m | m respondsTo: #sound].
	soundMorphs do: [:m |
		| startTime pan |
		startTime := (m position x - (self left + self borderWidth)) / 128.0.
		pan := (m position y - (self top + self borderWidth)) asFloat / (self height - (2 * self borderWidth) - m height).
		mixer add: ((RestSound dur: startTime), m sound copy) pan: pan].
	^ mixer

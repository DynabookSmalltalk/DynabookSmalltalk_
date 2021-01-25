private
split: aString
	"I return an Array or DiffElements containing aString splitted by whitespace ' and ""."

	^Array streamContents: [ :stream |
		| input separators |
		input := aString readStream.
		separators := self class separatorSet.
		[ input atEnd ] whileFalse: [
			| word separator |
			word := input
				upToAnyOf: separators
				do: [ :matchingSeparator | separator := matchingSeparator ].
			stream nextPut: (DiffElement string: word).
			separator ifNotNil: [
				stream nextPut: (DiffElement string: separator asString) ] ] ]
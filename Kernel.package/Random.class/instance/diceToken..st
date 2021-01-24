die rolling
diceToken: stream
	"Private. Mini scanner, see #roll:"

	stream atEnd ifTrue: [^ nil].
	stream peek isDigit ifTrue: [^ Integer readFrom: stream].
	^ stream next asLowercase
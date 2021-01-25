fonts
sendFont: aFont atIndex: index
	"Transmits the given fint to the other side"

	| code |
	code := CanvasEncoder codeFont.
	(aFont isMemberOf: StrikeFontSet) ifTrue: [code := CanvasEncoder codeFontSet].
	aFont isTTCFont ifTrue: [code := CanvasEncoder codeTTCFont].
	self sendCommand: {
		String with: code.
		self class encodeInteger: index.
		self class encodeFont: aFont }.

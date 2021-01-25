decoding
decodeTTCFont: fontString

	"Decode a string that consists of <familyName> <pointSize> <emphasis> (e.g. 'ComicSansMS 12 0') into a proper instance."

	| first second |
	first := fontString indexOf: $  startingAt: 1.
	second := fontString indexOf: $  startingAt: first + 1.

	(first ~= 0 and: [second ~= 0]) ifTrue: [
		^ TTCFont familyName: (fontString copyFrom: 1 to: (first - 1))
			size: (fontString copyFrom: first + 1 to: second - 1) asNumber
				emphasized: (fontString copyFrom: second + 1 to: fontString size) asNumber.
	].

	^ TextStyle defaultFont.

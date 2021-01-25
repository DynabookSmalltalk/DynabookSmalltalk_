as yet unclassified
showStats
"
CanvasEncoder showStats
"
	| answer |

	SentTypesAndSizes ifNil: [^Beeper beep].
	answer := WriteStream on: String new.
	SentTypesAndSizes keys asArray sort do: [ :each | | bucket |
		bucket := SentTypesAndSizes at: each.
		answer nextPutAll: each printString,' ',
				bucket first printString,'  ',
				bucket second asStringWithCommas,' ',
				(self nameForCode: each); cr.
	].
	StringHolder new contents: answer contents; openLabel: 'send/receive stats'.

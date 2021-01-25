as yet unclassified
showRatesSeen
"
StringSocket showRatesSeen
"
	| answer |

	MaxRatesSeen ifNil: [^Beeper beep].
	answer := WriteStream on: String new.
	MaxRatesSeen keys asArray sort do: [ :key |
		answer nextPutAll: key printString,'  ',((MaxRatesSeen at: key) // 10000) printString; cr
	].
	StringHolder new contents: answer contents; openLabel: 'send rates at 10 second intervals'.
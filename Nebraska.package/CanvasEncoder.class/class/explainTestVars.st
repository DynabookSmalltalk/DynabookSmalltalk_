as yet unclassified
explainTestVars
"
CanvasEncoder explainTestVars
"
	| answer oneBillion total |

	SimpleCounters ifNil: [^ Beeper beep].
	total := 0.
	oneBillion := 1000 * 1000 * 1000.
	answer := String streamContents: [ :strm | | data putter |
		data := SimpleCounters copy.
		putter := [ :msg :index :nSec | | nReps |
			nReps := data at: index.
			total := total + (nSec * nReps).
			strm nextPutAll: nReps asStringWithCommas,' * ',nSec printString,' ',
					(nSec * nReps / oneBillion printShowingMaxDecimalPlaces: 2),' secs for ',msg; cr
		].
		putter value: 'string socket' value: 1 value: 8000.
		putter value: 'rectangles' value: 2 value: 40000.
		putter value: 'points' value: 3 value: 18000.
		putter value: 'colors' value: 4 value: 8000.
	].
	StringHolder new
		contents: answer;
		openLabel: 'put integer times'.


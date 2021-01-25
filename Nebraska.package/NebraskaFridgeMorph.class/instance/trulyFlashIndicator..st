as yet unclassified
trulyFlashIndicator: aSymbol

	| state |

	state := (self 
		valueOfProperty: #fridgeFlashingState
		ifAbsent: [false]) not.
	self setProperty: #fridgeFlashingState toValue: state.

	self 
		addMouseActionIndicatorsWidth: 15 
		color: (Color green alpha: (state ifTrue: [0.3] ifFalse: [0.7])). Beeper beep.
	"self world displayWorldSafely."
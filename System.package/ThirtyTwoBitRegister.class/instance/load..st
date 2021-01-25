accessing
load: anInteger
	"Set my contents to the value of given integer."

	(anInteger positive and: [anInteger digitLength <= 4])
		ifFalse: [self error: 'out of range: ', anInteger printString].
	low := anInteger bitAnd: 16rFFFF.
	hi := (anInteger bitShift: -16) bitAnd: 16rFFFF

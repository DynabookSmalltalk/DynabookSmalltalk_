class initialization
initializeDigitValues
	"Initialize the well known digit value of ascii characters.
	Note that the DigitValues table is 1-based while ascii values are 0-based, thus the offset +1."
	
	| newDigitValues |
	newDigitValues := Array new: 256 withAll: -1.
	"the digits"
	0 to: 9 do: [:i | newDigitValues at: 48 + i + 1 put: i].
	"the uppercase letters"
	10 to: 35 do: [:i | newDigitValues at: 55 + i + 1 put: i].
	"the lowercase letters"
	10 to: 35 do: [:i | newDigitValues at: 87 + i + 1 put: i].
	DigitValues := newDigitValues
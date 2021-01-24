private
butLowestNDigits: n
	"make a new integer removing N least significant digits of self."
	
	^self bitShiftMagnitude: -8 * n
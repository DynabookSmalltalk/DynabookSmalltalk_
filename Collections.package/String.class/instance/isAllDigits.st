testing
isAllDigits
	"whether the receiver is composed entirely of digits"
	
	^self allSatisfy: [ :character | character isDigit ]
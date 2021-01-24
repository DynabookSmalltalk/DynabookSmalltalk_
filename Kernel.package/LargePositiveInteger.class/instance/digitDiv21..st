private
digitDiv21: anInteger
	"This is part of the recursive division algorithm from Burnikel - Ziegler
	Divide a two limbs receiver by 1 limb dividend
	Each limb is decomposed in two halves of p bytes (8*p bits)
	so as to continue the recursion"
	
	| p qr1 qr2 |
	"split in two parts, rounded to upper multiple of 4"
	p := (anInteger digitLength + 7 bitShift: -3) bitShift: 2.
	p < self class thresholdForDiv21 ifTrue: [^(self digitDiv: anInteger neg: false) collect: #normalize].
	qr1 := (self butLowestNDigits: p) digitDiv32: anInteger.
	qr2 := (self lowestNDigits: p) + (qr1 last bitShift: 8*p) digitDiv32: anInteger.
	qr2 at: 1 put: (qr2 at: 1) + ((qr1 at: 1) bitShift: 8*p).
	^qr2
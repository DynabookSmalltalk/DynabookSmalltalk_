private
digitDiv32: anInteger
	"This is part of the recursive division algorithm from Burnikel - Ziegler
	Divide 3 limb (a2,a1,a0) by 2 limb (b1,b0).
	Each limb is made of p bytes (8*p bits).
	This step transforms the division problem into multiplication
	It must use a fast multiplyByInteger: to be worth the overhead costs."
	
	| a2 b1 d p q qr r |
	"split in two parts, rounded to upper multiple of 4"
	p :=(anInteger digitLength + 7 bitShift: -3) bitShift: 2.
	(a2 := self butLowestNDigits: 2*p) 
		< (b1 := anInteger butLowestNDigits: p)
		ifTrue:
			[qr := (self butLowestNDigits: p) digitDiv21: b1.
			q := qr first.
			r := qr last]
		ifFalse:
			[q := (1 bitShift: 8*p) - 1.
			r := (self butLowestNDigits: p) - (b1 bitShift: 8*p) + b1].
	d := q * (anInteger lowestNDigits: p).
	r := (self lowestNDigits: p) + (r bitShift: 8*p) - d.
	[r < 0]
		whileTrue:
			[q := q - 1.
			r := r + anInteger].
	^Array with: q with: r
	
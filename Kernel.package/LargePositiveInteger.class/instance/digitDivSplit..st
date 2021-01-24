private
digitDivSplit: anInteger
	"This is the recursive division algorithm from Burnikel - Ziegler
	See Fast Recursive Division - Christoph Burnikel, Joachim Ziegler
	Research Report MPI-I-98-1-022, MPI Saarbrucken, Oct 1998
	https://pure.mpg.de/rest/items/item_1819444_4/component/file_2599480/content"
	
	| s m t a b z qr qDigits q i high low |
	"round digits up to next power of 2"
	s := anInteger digitLength.
	m := 1 bitShift: (s - 1) highBit.
	"shift so that leading bit of leading byte be 1, and digitLength power of two"
	s := m * 8 - anInteger highBit.
	a := self bitShift: s.
	b := anInteger bitShift: s.
	
	"Decompose a into t limbs - each limb have m bytes
	choose t such that leading bit of leading limb of a be 0"
	t := (a highBit + 1 / (m * 8)) ceiling.
	z := a butLowestNDigits: t - 2 * m.
	i := t - 2.
	qDigits := Array new: t - 1.
	"and do a division of two limb by 1 limb b for each pair of limb of a"
	[qr := z digitDiv21: b.
	qDigits at: t - 1 - i put: qr first.
	(i := i - 1) >= 0] whileTrue:
		[z := (qr last bitShift: 8*m) + (a copyDigitsFrom: i * m + 1 to: i + 1 * m)].
	"recompose the quotient from digits"
	t < 3
		ifTrue:
			[q := 0.
			qDigits do: [:qi | q := (q bitShift: 8 * m) + qi]]
		ifFalse:
			["Use a O(n) reconstruction - note the interlace to avoid overlapping digits"
			high  := LargePositiveInteger new: t - 2 * m + qDigits first digitLength.
			low := LargePositiveInteger new: t - 2 * m.
			1 to: t - 1 by: 2 do: [:k | high inplaceAddNonOverlapping: (qDigits at: k) digitShiftBy: t - 1 - k * m].
			2 to: t - 1 by: 2 do: [:k | low inplaceAddNonOverlapping: (qDigits at: k) digitShiftBy: t - 1 - k * m].
			q := high + low].
	^Array with: q with: (qr last bitShift: s negated)
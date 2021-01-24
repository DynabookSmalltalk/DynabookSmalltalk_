private
divideByInteger: anInteger
	"If length is worth, engage a recursive divide and conquer strategy,
	more efficient than super"
	| qr |
	(anInteger digitLength < (self class thresholdForDiv21 * 2)
			or: [self digitLength <= anInteger digitLength])
		ifTrue: [^ self digitDiv: anInteger neg: self negative ~~ anInteger negative].
	qr := self abs digitDivSplit: anInteger abs.
	self negative ifTrue: [qr at: 2 put: qr second negated].
	self negative = anInteger negative ifFalse: [qr at: 1 put: qr first negated].
	^qr
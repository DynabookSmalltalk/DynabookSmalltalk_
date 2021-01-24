private
copyDigitsFrom: start to: stop
	"Make a new integer keeping only some digits of self."
	
	| len slice |
	start > 0 ifFalse: [^self error: 'start index should be at least 1'].
	len := self digitLength.
	(start > len or: [start > stop]) ifTrue: [^0].
	stop >= len
		ifTrue: [start = 1 ifTrue: [^self].
				len := len - start + 1]
		ifFalse: [len := stop - start + 1].
	slice := self class new: len.
	slice replaceFrom: 1 to: len with: self startingAt: start.
	^slice normalize
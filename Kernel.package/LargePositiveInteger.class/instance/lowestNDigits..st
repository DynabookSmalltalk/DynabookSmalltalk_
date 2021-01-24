private
lowestNDigits: n
	"Make a new integer keeping only n least significant digits of self"
	
	| low |
	n >= self digitLength ifTrue: [^self].
	low := self class new: n.
	low replaceFrom: 1 to: n with: self startingAt: 1.
	^low normalize
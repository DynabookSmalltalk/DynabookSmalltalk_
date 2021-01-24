sorting
sorted
	"an Interval is already sorted"
	step < 0 ifTrue: [^self reversed].
	^self
converting
adaptToInteger: rcvr andCompare: selector
	"Assuming that self is properly reduced, it cannot be an Integer"
	selector == #= ifTrue: [^false].
	selector == #~= ifTrue: [^true].
	"Inequality: avoid division with this transformation:
	rcvr op: (num/den)
	rcvr - (num/den) op: 0
	rcvr*den op: num"
	^rcvr * denominator perform: selector with: numerator
comparing
hash
	"Answer an integer value that is related to the value of the receiver.
	 Since the integers are by definition perfectly distributed answer self
	 (it is impossible to derive a hash function that is better distributed
	 than the SmallIntegers themselves). c.f. LargePositiveInteger hash."

	^self
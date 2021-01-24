comparing
hash
	"Answer an integer value that is related to the value of the receiver.
	 Take care that the hash value is the same in both 32-bit and 64-bit versions.
	 Since the integers are by definition perfectly distributed a SmallInteger's hash is itself
	 (it is impossible to derive a hash function that is better distributed than the SmallIntegers
	 themselves).  Therefore, for integers that could possibly fit in the SmallInteger range, answer
	 self.  For values well outside of the SmallInteger range on 64-bits answer a hash that avoids
	 large integer arithmetic."
	^self digitLength <= 8
		ifTrue: [self]
		ifFalse:
			[ByteArray
				hashBytes: self
				startingWith: self species hash]
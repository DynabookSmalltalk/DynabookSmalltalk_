converting
changeClassTo: aBehavior
	"Change the class of the receiver to the argument, provided
	 that the format of the argument matches the format of the receiver's class."
	aBehavior adoptInstance: self.
	^self
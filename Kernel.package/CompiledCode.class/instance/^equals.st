comparing
= aMethod
	"Answer whether the receiver implements the same code as the argument, aMethod.
	 Here ``same code'' means that if the receiver's source is compiled with the same
	 compiler it should produce the same sequence of bytecodes and literals, same
	 trailer and same properties.  Hence this definition of #= (only one of many plausible
	 definitions) can be used to quickly identify changes in the compiler's output."
	self == aMethod ifTrue:
		[^true].
	(aMethod isCompiledCode
	 and: [self size = aMethod size
	 and: [self header = aMethod header]]) ifFalse:"N.B. includes numLiterals comparison."
		[^false].
	self initialPC to: self endPC do:
		[:i | (self at: i) = (aMethod at: i) ifFalse: [^false]].
	^self hasSameLiteralsAs: aMethod
instruction stream support
isSyntheticStoreAt: pc in: method for: anInstructionStream
	"Answer whether the bytecode at pc is a store or store-pop of an indirect temp vector,
	 which implement mutable closed-over variables in the the closure implementation.
	 Stores into temp vectors are not real stores.  N.B. pcPreviousTo:in:for: is slow, so filter
	 out any preceding bytecodes other than what looks like a pushNewArrayCode.  But the
	 pcPreviousTo:in:for: is still necessary, since the presence of a pcPreviousTo:in:for: in the
	 right place is potentially ambiguous, possibly part of a different bytecode seqence."

	^(self isTempStoreAt: pc in: method)
	  and: [pc - 2 >= method initialPC
	  and: [(method at: pc - 2) = self pushNewArrayCode
	  and: [(method at: pc - 1) <= 127
	  and: [pc - 2 = (self pcPreviousTo: pc in: method for: anInstructionStream)]]]]
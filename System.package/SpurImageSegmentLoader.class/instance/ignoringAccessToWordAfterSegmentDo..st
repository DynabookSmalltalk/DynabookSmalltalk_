filling
ignoringAccessToWordAfterSegmentDo: aBlock
	"Both fillBytes:oop: and fillShorts:oop: may read an extra word beyond the end of data.
	 If the object is the last in the segment this will cause an out-of-bounds error.
	 Squash this error."
	^aBlock
		on: Error "Why do we still not have SubscriptOutOfBounds or some such??"
		do: [:ex|
			ex messageText = ('subscript is out of bounds: ', (segment size + 1) printString) ifFalse:
				[ex pass].
			ex
				searchFrom: (ex signalerContext findContextSuchThat: [:ctxt| ctxt selector == #uint32At:]);
				resumeUnchecked: 0]
statistics
doSpaceAnalysis
	"Capture statistics about the IS and print the number of instances per class and space usage"
	| is64Bit index instCount instSpace |
	state == #activeCopy ifFalse:[self errorWrongState].
	instCount := Dictionary new.
	instSpace := Dictionary new.
	is64Bit := ((segment at: 1) bitAnd: 16rFFFFFF) >= 68000.
	index := 3. 	"skip version word"
	"The Spur image format (in little endian format) is (num bits:fieldName(s)))
	 msb:	| 8: numSlots		| (on a byte boundary)
			| 2 bits				|	(msb,lsb = {isMarked,?})
			| 22: identityHash	| (on a word boundary)
			| 3 bits				|	(msb <-> lsb = {isGrey,isPinned,isRemembered}
			| 5: format			| (on a byte boundary)
			| 2 bits				|	(msb,lsb = {isImmutable,?})
			| 22: classIndex		| (on a word boundary) : LSB"
	[index > segment size] whileFalse:
		[| hiWord loWord numSlots bytes classIndex |
		 loWord := segment at: index.
		 hiWord := segment at: index + 1.
		 numSlots := hiWord bitShift: -24.
		 numSlots = 255
			ifTrue: "word is an overflow header word.  Slot count is in the least significant 56 bits."
				[numSlots := hiWord = 0
								ifTrue: [loWord]
								ifFalse: [(hiWord bitShift: 32) + loWord bitAnd: 16rFFFFFFFFFFFFFF].
				 loWord := segment at: index + 2.
				 hiWord := segment at: index + 3.
				 bytes := 16] "two word header"
			ifFalse:
				[bytes := 8]. "one word header"
		 bytes := bytes + (8 * is64Bit "objects are a multiple of 8 bytes in length, with at leats one slot"
								ifTrue: [numSlots max: 1]
								ifFalse: [(numSlots max: 1) + 1 // 2]).
		 classIndex := loWord bitAnd: 16r3FFFFF.
		 (index > 3 or: [classIndex ~~ 33]) ifTrue: "Don't count the initial arrayOfRoots"
			 [instCount at: classIndex put: (instCount at: classIndex ifAbsent:[0]) + 1.
			  instSpace at: classIndex put: (instSpace at: classIndex ifAbsent:[0]) + bytes].
		 index := index + (bytes / 4)].
	^{instCount. instSpace} collect: [:dict| self copyStatisticsDictionaryWithClassNames: dict]
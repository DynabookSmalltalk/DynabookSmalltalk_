reading
readObject
	"Read the header and the class of the object, instantiate it, and store it in oopMap at its oop."
	| headerLo headerHi oop numSlots classIndex format rawNumSlots |
	"the oop is the address of the two byte header (which follows the overflow size word, if there is one)."
	oop := position - 8. "compensate for 64-bit version stamp"
	headerLo := self readUint32.
	headerHi := self readUint32.
	rawNumSlots := headerHi bitShift: -24.
	rawNumSlots = 255
		ifTrue: "128-bit header; overflow slots in least significant 32 bits of first 64-bit header word"
			[numSlots := headerLo.
			 oop := position - 8. "compensate for 64-bit version stamp"
			 headerLo := self readUint32.
			 headerHi := self readUint32]
		ifFalse: "64-bit header"
			[numSlots := rawNumSlots].
	"N.B. The format field is a 5 bit field, but immediately above it is the
	 remembered bit which is used to mark classes is the segment."
	self checkValidFormat: (format := (headerLo bitShift: -24) bitAnd: 63).
	classIndex := headerLo bitAnd: 16r3FFFFF.
	^[oopMap at: oop ifAbsentPut:
		[self allocateObject: format classIndex: classIndex slots: numSlots]]
			ensure: "Spur objects have at least one slot"
				[position := oop + 16 + ((numSlots max: 1) * 8)]
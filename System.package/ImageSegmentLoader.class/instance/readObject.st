reading
readObject
	| header oop nWords class format |
	header := self readUint32.
	(header bitAnd: HeaderTypeMask) caseOf: {
		[HeaderTypeSizeAndClass] ->
			[nWords := header >> 2. class := self readUint32. header := self readUint32].
		[HeaderTypeClass] ->
			[class := header - 1. header := self readUint32. nWords := header >> 2 bitAnd: 63].
		[HeaderTypeShort] ->
			[nWords := header >> 2 bitAnd: 63. class := header >> 12 bitAnd: 31].
	} otherwise: [self error: 'unexpected free chunk'].
	nWords := nWords - 1.	"nWords includes 1 header word"
	oop := position.
	^[oopMap at: oop ifAbsentPut:
		[format := header >> 8 bitAnd: 15.
		"hash := header >> 17 bitAnd: 4095."
		self allocateObject: format class: class size: nWords]]
			ensure: [position := oop + (nWords * 4)]



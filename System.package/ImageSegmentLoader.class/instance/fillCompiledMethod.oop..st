filling
fillCompiledMethod: method oop: oop
	"The method header was already mapped to Spur format.
	Here we just insert the bytecode for calling a primitive.
	The last byte is left at 0 to indicate no trailer."
	| header start size prim word |
	position := oop.
	header := self mapOop: self readUint32.
	1 to: method numLiterals do:
		[:i | method literalAt: i put: (self mapOop: self readUint32)].
	start := method initialPC - 1.
	size := method basicSize - start - 1.	"subtract 1 byte for empty trailer"
	(method header anyMask: 65536) ifTrue: "add primitive call"
		[prim := self mapToSpurPrim: header.
		method basicAt: start + 1 put: 16r8B.
		method basicAt: start + 2 put: prim \\ 256.
		method basicAt: start + 3 put: prim // 256.
		start := start + 3.
		size := size - 3].
	word := self readUint32.
	1 to: size do:
		[:i | method basicAt: start + i put: (word bitAnd: 16rFF).
		word := (i bitAnd: 3) = 0 
			ifTrue: [self readUint32]
			ifFalse: [word >> 8]].

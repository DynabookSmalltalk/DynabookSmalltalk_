reading
readObjectAt: oop
	| headerType oldPos |
	oopMap at: oop ifPresent: [:obj | ^obj].
	headerType := (self uint32At: oop) bitAnd: HeaderTypeMask.
	oldPos := position.
	position := oop - (BytesInHeader at: headerType).
	^[self readObject] ensure: [position := oldPos]
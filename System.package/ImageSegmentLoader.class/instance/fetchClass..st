reading
fetchClass: classOop
	| index class superclass format |
	classOop < 32 ifTrue:
		[^CompactClasses at: classOop].
	(index := classOop >> 2) >= 16r20000000 ifTrue:
		[^outPointers at: index - 16r20000000].
	"class is in segment ... load it out-of-order"
	superclass := self fetchClass: (self uint32At: classOop + 4).
	format := self mapOop: (self uint32At: classOop + 12).
	format := self mapToSpurFormat: format.
	class := self readObjectAt: classOop.
	class superclass: superclass
		methodDictionary: MethodDictionary new
		format: format.
	class flushCache.
	^class
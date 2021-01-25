filling
fillBehavior: class oop: oop
	position := oop.
	class superclass: (self mapOop: self readUint32).
	class methodDict: (self mapOop: self readUint32).
	class setFormat: (self mapToSpurFormat: (self mapOop: self readUint32)).
	4 to: class class instSize do:
		[:i | class instVarAt: i put: (self mapOop: self readUint32)].
	class flushCache.
	^class
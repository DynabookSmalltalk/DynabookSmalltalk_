printing
printOn: aStream
	| class mclass selector |
	method ifNil:
		[^super printOn: aStream].

	closureOrNil ifNotNil:
		[aStream nextPutAll: '[] in '.
		 closureOrNil outerContext ifNotNil:
			[:outer|
			 outer printOn: aStream.
			 ^self]].

	class := self objectClass: self receiver.
	mclass := method methodClass.
	selector := method selector ifNil: [method defaultSelector].

	aStream nextPutAll: class name.
	mclass ~~ class ifTrue:
		[aStream nextPut: $(; nextPutAll: mclass name; nextPut: $)].
	aStream nextPutAll: '>>'; nextPutAll: selector.

	(selector == #doesNotUnderstand:
	 and: [(self objectClass: (self tempAt: 1)) == Message]) ifTrue:
		[aStream space.
		(self tempAt: 1) selector printOn: aStream]
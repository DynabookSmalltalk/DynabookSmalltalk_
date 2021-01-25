I/O
processIO

	inArrays ifNil: [^self].

	associate arraysFromAssociate: outArrays.
	outArrays := OrderedCollection new.
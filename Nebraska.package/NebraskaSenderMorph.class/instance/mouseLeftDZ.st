as yet unclassified
mouseLeftDZ

	| dz |
	dz := self valueOfProperty: #specialDropZone ifAbsent: [^self].
	dz color: Color transparent.
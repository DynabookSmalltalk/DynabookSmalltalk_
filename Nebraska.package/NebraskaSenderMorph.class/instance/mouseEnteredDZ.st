as yet unclassified
mouseEnteredDZ

	| dz |
	dz := self valueOfProperty: #specialDropZone ifAbsent: [^self].
	dz color: Color blue.
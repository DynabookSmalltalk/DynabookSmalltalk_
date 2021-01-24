layout-properties
cellGap
	"Layout specific. This property specifies an extra space *between* cells in the layout."
	| props |
	props := self layoutProperties.
	^props ifNil:[0] ifNotNil:[props cellGap].
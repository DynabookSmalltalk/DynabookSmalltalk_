list management
rowAtLocation: aPoint
	"return the number of the row at aPoint"
	| y |
	y := aPoint y.
	y < self top ifTrue: [ ^ 1 min: self getListSize ].
	^((y - self top // self rowHeight) + 1) min: self getListSize max: 0
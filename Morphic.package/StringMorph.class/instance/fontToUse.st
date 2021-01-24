drawing
fontToUse
	"Support un-initialized font or emphasis variable."
	
	^ font ifNil: [TextStyle defaultFont emphasized: (self emphasis ifNil: [0])]
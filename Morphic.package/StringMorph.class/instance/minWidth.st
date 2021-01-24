layout
minWidth
	"Layout specific."
	
	^ self hResizing = #spaceFill
		ifTrue: [0] ifFalse: [super minWidth max: (self fontToUse widthOfString: self contents)]
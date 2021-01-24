instance creation
width: aNumber color: aColor
	"Since I am abstact, use SimpleBorder instead."
	
	^ (self == BorderStyle ifTrue: [SimpleBorder] ifFalse: [self]) new
		color: aColor;
		width: aNumber;
		yourself
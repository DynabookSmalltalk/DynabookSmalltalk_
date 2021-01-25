converting to rectangle
origin: aPoint 
	"Answer a Rectangle whose extent is the receiver and whose origin is 
	aPoint. This is one of the infix ways of expressing the creation of a 
	rectangle."

	^Rectangle origin: aPoint extent: self
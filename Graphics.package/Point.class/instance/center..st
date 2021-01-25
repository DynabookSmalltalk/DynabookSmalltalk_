converting to rectangle
center: aPoint 
	"Answer a Rectangle whose extent is the receiver and whose center is 
	aPoint. This is one of the infix ways of expressing the creation of a 
	rectangle."

	^Rectangle center: aPoint extent: self
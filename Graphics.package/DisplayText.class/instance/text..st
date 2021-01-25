accessing
text: aText 
	"Set the receiver to display the argument, aText."
	
	text := aText.
	form := nil.
	self changed.
	
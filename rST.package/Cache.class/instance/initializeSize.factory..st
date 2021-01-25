initialization
initializeSize: aNumber factory: aBlock 
	size _ aNumber.
	values _ Array new: aNumber withAll:{nil. nil. nil}.
	factory _ aBlock.
	calls _ 0.
	hits _ 0
layout
layoutChanged
	"Update rotatedForm and compute new bounds."
	
	| priorBounds |
	fullBounds ifNotNil: [self changed].
	
	priorBounds := bounds.
	
	self flag: #refactor. "mt: Such side-effects in #layoutChanged can have a severe impact on performance. Better not overwrite it but manage the rotatedForm elsewhere and from there call #layoutChanged if bounds change. Also, just overwrite #extent to use the extent of the rotated form."
	self generateRotatedForm.
	bounds := bounds origin extent: rotatedForm extent.
	
	priorBounds ~= bounds
		ifTrue: [super layoutChanged].

	self changed.

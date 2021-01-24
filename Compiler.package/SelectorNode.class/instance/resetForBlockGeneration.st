code generation
resetForBlockGeneration
	"Reset the receiver to an unassigned state such that its index
	 in the encoder's literalStream is as yet to be determined."
	code := SendType negated.
	index := nil
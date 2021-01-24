testing
generatingFullBlock
	"Answer if the encoder is currently generating a FullBlock, embedded in some method."

	"When generating a FullBlock a copy of the encoder for the home emthod (rootNode)
	 is used, and hence the following is true."
	^rootNode encoder ~~ self
code generation
resetFromCopy: aFieldNode
	"Reset the state of the recever to match that of the argument.
	 This is used to reset nodes that may have been repurposed
	 while generatig the compiled method for a full block.
	 Temps are managed via the reindexingLocalsDo:encoder: route,
	 not via reindexingLiteralsDo:."
	self shouldNotImplement
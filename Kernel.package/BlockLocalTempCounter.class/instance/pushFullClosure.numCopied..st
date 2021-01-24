instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied
	"Push Full Closure bytecode."
	self error: 'BlockLocalTempCounter should not be used with full block compiled methods.  A full block''s numTemps is accessible directly from its method.'
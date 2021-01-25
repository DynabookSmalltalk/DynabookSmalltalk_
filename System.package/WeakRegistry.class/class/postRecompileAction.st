recompilation
postRecompileAction
	"Reinitialize the finalizers in WeakRegistries to ensure the blocks don;t reference stale methods."

	self allSubInstancesDo:
		[:weakRegistry| weakRegistry installFinalizer]
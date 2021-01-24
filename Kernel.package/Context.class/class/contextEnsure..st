special context creation
contextEnsure: block
	"Create an #ensure: context that is ready to return from executing its receiver.
	
	As ctxt is *not* a top context as required by #jump, we need to put a (fake) return value (nil) on its stack. Otherwise, #jump will pop something different from the stack. Concretely, this caused the bug described in [1] (Scenario 1) because the latest stack top was the closure vector {chain}. This closure vector was accidently popped away so that in the final return statement, #pushRemoteTemp:inVectorAt: raised an error subscript bounds (because the next stack item was not variable). Read the linked bug report for more details.

	[1] http://forum.world.st/BUG-s-in-Context-control-jump-runUntilErrorOrReturnFrom-td5107263.html"

	| ctxt chain |
	ctxt := thisContext.
	[chain := thisContext sender cut: ctxt.
	ctxt push: nil. "fake return value"
	ctxt jump] ensure: block.
	"jump above will resume here without unwinding chain"
	^ chain
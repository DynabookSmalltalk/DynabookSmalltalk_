closure analysis
deoptimize
	"Deoptimize the blocks in a caseOf:[otherwise:] that is being used in a cascade."
	elements do:
		[:aMessage|
		self assert: aMessage selector key == #->.
		aMessage receiver deoptimize.
		aMessage arguments first deoptimize]
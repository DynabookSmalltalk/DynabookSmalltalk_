accessing
useRoundedCorners
	"Somewhat special cased because we do have to fill Display for this"
	super useRoundedCorners.
	self == self world ifTrue:[Display bits primFill: 0]. "done so that we *don't* get a flash"
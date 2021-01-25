menus
step

	self processIO.

	"savedWorld := Processor activeProcess world.
	Processor activeProcess setWorld: world."

	self flag: #bob.		"in this version, world is THE WORLD, so it steps itself"
	"world doOneCycle."

	"Processor activeProcess setWorld: savedWorld."

	clients do: [ :each | each canvas apply: [ :ignore | ]].	"for modes that need a little push"

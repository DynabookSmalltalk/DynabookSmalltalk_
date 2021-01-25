display box access
checkForNewScreenSize
	"Check whether the screen size has changed and if so take appropriate actions"

	Display isVirtualScreen ifTrue: [^Display checkForNewScreenSize].

	Display extent = DisplayScreen actualScreenSize
		ifFalse: [Display restore].
read/write segment
copyFromRootsLocalFileFor: rootArray sizeHint: segSize
	"If the roots include a World, add its Player classes to the roots."
	| newRoots |

	arrayOfRoots := rootArray.
	[(newRoots := self rootsIncludingPlayers) == nil] whileFalse: [
		arrayOfRoots := newRoots].		"world, presenter, and all Player classes"
	self copyFromRoots: arrayOfRoots sizeHint: segSize.